Return-Path: <linux-arm-msm+bounces-105670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD5vBxZl+GkAuAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 11:21:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C04BAE14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 11:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E768630262F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 09:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2807C37757A;
	Mon,  4 May 2026 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DP0rHUCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mdw8BrzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C89837755D
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886430; cv=none; b=dP2D5tPwrmaNT/E2E9jvwbOzn09PeScUWBCCSN3BXrf7XGn8ytviCruqX0hoicu/3EZOR+8WpQpIAYCOLZVGItBlVVjEMW9U9TWzXYqquStpX8qXCHbwrO9RKkFjKrLl6K2lCNmdIghYJchlZdSr4LrrTIK1GE88VcDPaL6fWBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886430; c=relaxed/simple;
	bh=oQ9eG6ob+yWY+piBXjP6NuGOsypMkng4SMTY/pziYx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFZ7uEiwRxK9lNBBwIXGZybC7VWLExyOc67qzd2sPnlzLyMO0ZltMmmLBlNGJ7At6rs6FAeWt8DmGNKQ0t8GdhekNNSsCHuNqVHVXFTHf6/AYAlvGqFYMfKe6Um/GffDy+xVlW1HnhKhOMxnVhAT9Gs6UUTa8bWUrDoUde8sYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DP0rHUCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mdw8BrzG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fWfo437067
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 09:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xacEJq2Zps3FgavLd4lLbebjwrUmMkWW1Dnv6tEkWBA=; b=DP0rHUCcKYKrOTU6
	4+YLLRO47dTK0k95xf1aJjr/zEC1BeU1ZmwbVwTfk2Ye9TPn12j56h1pFtCLQAC4
	KhYDjPtN01UugvozyOjlVSyzEjIoYB66OLruaOmkbrdsR/a9Vhg6Hi2FJsXBmucu
	yDxrMsQbSShgrYKrMJJeQ4yyShtgpm3+qErJTb2VGDsfat2kLJkr6Z+Z4OUiUPN2
	vqKlDgQNzX0Elz9mtysDKTIQ37s/uUxNiXnIutHnNZxaKu5x8xAVTDGN4r3tpeb0
	QZqvOgpCO2l4LK6eoDpj4XlHxYa3zhG6bviZdFoj+kWClXiGFA/uAZT9PvhmihHE
	XA/PQw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8kg54gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:20:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so4520625b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 02:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777886425; x=1778491225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xacEJq2Zps3FgavLd4lLbebjwrUmMkWW1Dnv6tEkWBA=;
        b=Mdw8BrzGccVYD4tcjPgaLhNUkC+ofpzKlT7w/iGeJzV+ny9wzGeujkRpsiafQ2VwWV
         KVg5zc8Kci/digbulVY4K7oh5hseXoR5ApmBSraeaazgFPYw3nqrUCu9OMj3Vjf/0YV1
         5rU3tJ6QNRONqq4lUcGpDefC8W/9hforfPzYQ3wbXyJq4T0LNk4gHUAte1VUQ0WhB2QJ
         sAo4nVoi3lxcnTgDbt3bUUHv/eCwXBhIh+1qa9FCGzoapquZ/JGUlhC4bGzDl4VmyMlh
         Yet+BA7akKoj6O5zRPABCU7uhg4uh5NMmteoDy1jSq+XOksM8Hsuh3WAaRuYjyxL9MRF
         XEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886425; x=1778491225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xacEJq2Zps3FgavLd4lLbebjwrUmMkWW1Dnv6tEkWBA=;
        b=OEVziRPP6oRxDSOfH9JGXVfP/bykH/waXW15vlQwjcc8p6FYihOOUQguG0xd6n4ko8
         R849mBAEQl1MfRkR42Wh474ot/J7P03zFa4yCw+k7/6OhgZa4d9aWpEJPD4UgT5Q2WNN
         g4EwiZDPVrh6RtWEQAsqc9HGxd0xeKGhnSr6ZxqDxVQCZUpjp1y6Dg1QvAQaOKCjEvGI
         d6sTaXttqjg07CXGlZAvJs6juH8wh8K6J0yLwcBIPmaOkz/PNagUJzhPqeEOXpkDrtlQ
         qIkw42se98pnew8U/Y378crynMk1PTEAuiq99jMxbfF7rUA95G3sGMN/7vpYWOXo1a4d
         v+rg==
X-Gm-Message-State: AOJu0YyqL/6LK/K5aJJpB43BTFF15PZMhXAt+0zO8abuiuiUTKGnpsB7
	qP1ASQ9U29CB5NbdN8x4cgM64tqAH8sK7hIPz5ScXx9X1FWT+GznGTZJhcMjWM8xvywndbJ8X0T
	ZoeW9RgPa9kTK5H+8kZhF+bjbxRDRFm54oEkUDXNWch3U6ev7L8+FxWe/qoa82pLyOfet
X-Gm-Gg: AeBDieuGFmWXkTSMqKOeiWQw+MDfcTLcVQOgqa9XsEgRZuRSasFoInaAZL8IsAFXHns
	A2mYL91cSkq//qTqKrXku0z4ArgX5auuVN3DJwpQgXtnegs+x29b9j3tywLNi2D8Y6uvRwy9+vq
	Est92+FHwy3QcaiHPAdF+x59URqI8zFe/4eZLgjQTehUlArHj/pBtdGpqN2yjtVUvjmg3bfebRF
	LjEnjN1DwNuXyPddNvhd6w73xijA48W5U4LpNrMN7AlMh4Il9ll+q2lYgSa7urFbtA7+obVO+Hn
	vteZpUXjG/+p1herh+9Qv1sKR3hz5zq2mdXybsK+QN25jlJYK9/IOy8qtvYJoezGTTKJOWMJ6Ni
	lu2VEKAZS6D0mXlVtVcPG5L2IM0uLar4UMN7KkgppigH1kVOrgrtcsGolW1mALA==
X-Received: by 2002:aa7:9f07:0:b0:835:388c:9764 with SMTP id d2e1a72fcca58-835388ca073mr4931624b3a.37.1777886425043;
        Mon, 04 May 2026 02:20:25 -0700 (PDT)
X-Received: by 2002:aa7:9f07:0:b0:835:388c:9764 with SMTP id d2e1a72fcca58-835388ca073mr4931557b3a.37.1777886424440;
        Mon, 04 May 2026 02:20:24 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0049sm12316337b3a.33.2026.05.04.02.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:20:24 -0700 (PDT)
Message-ID: <81d83991-df25-4fc4-8261-6793ea9dc438@oss.qualcomm.com>
Date: Mon, 4 May 2026 14:50:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
        apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-3-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260427095603.1157963-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P8sKQCAu c=1 sm=1 tr=0 ts=69f864da cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DWWpLck2SfFL7czMIZ0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: urLRm75s_IbS8bnn8wxDTsPMjg7Z-3Rv
X-Proofpoint-ORIG-GUID: urLRm75s_IbS8bnn8wxDTsPMjg7Z-3Rv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA5OSBTYWx0ZWRfX6iB3k+p6AQZu
 hdQ1fWJcLiPr8SC7KeCHnhhxyef3B+fN+meUVcbhyEJ9DPCcdCXvnIT6E/Z7cf/pIeCo6Vxyure
 gO+hBiAJ2j6yCjPtnawx/+Bpfo8GfodEZMQ8tmrIx2iA7FH3k5HN+AVveTSELq7q7eIbi7IepT9
 AnUNURVGuEYP3viAY2o75SL5RKMWIJcHw0GhPgqFwUL6YP+VPklcsJ7LGsiY6fwRAqmtr3HVK0N
 bzeAIKvEZ0EO7om6iNss2o83OArcyDTxGpPtV0Lfmsq2Cr5sguJga0YTUdI9MSZy9TIln2wZuaU
 bCmYSxM/pIazbHI2pPcSdJdQFvPVHCn1XDRecnTdIRUaBqJ6cEkVsJesIy9RdraADsKimzKqh/3
 VZFapqt14xeirLXX/NetYN/BnJ8Qmw3kHObBlSYaca5Lp3IKkFoFQ0RFZG2R10ZBWDqtWp+YZYj
 2HpEZP7etz3ljoiwmEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040099
X-Rspamd-Queue-Id: AE9C04BAE14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-105670-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal


