Return-Path: <linux-arm-msm+bounces-117891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MS8WFThWT2raegIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:05:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE7E72E0DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:05:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UQpqkWK8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MArVtA5i;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117891-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117891-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C1923006801
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DD33E6DE3;
	Thu,  9 Jul 2026 07:58:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60F3DC4C2
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:58:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583919; cv=none; b=eKAGuKSc14y0mgTJ4HhDVzxB8KNpR3o1CqveI8V8IykR3kL5gvCQy8JK9LL/qT8Iz+sai/xVFOn5d+VCNophDEpEVpKGk5fbTk5QcDZmWS0LQ1nrGLQyiqWr7ejhXEYmcsm5LN7+9wxKl6R/fACZ6Ep19R+0fnrs4/YdUYQRQZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583919; c=relaxed/simple;
	bh=CRMMeKMYr/uFkbFihLtIDhSkzHmLcV1nUBdzd1/G2T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frRQK9ad1HYHTLAdI6ugXun9GtHscP6sFXBhi0GbsCwfEBfnCnaNbq3b8pkldoLmFqqtwQgyshj7u924oRjt/yDDCCfuxvbaZhTd4esbyuCtP7kAkZrrek5GmZ6CtUrlDpYlSWKObRiKxLzvzfARYIRCeHoVnV7khgJvNwaFAWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQpqkWK8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MArVtA5i; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960QQQ784654
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6wdOtbgBM/5Qv1dBByCOfeS0K8UvhwHlRKLvCJbRTSQ=; b=UQpqkWK8LYeS2fez
	0r0MQIMp2KhwUUdw6mBqJ3xpU5R50LgaOAAXL4Q9+cWoSeBRvS6UytRQkPQC1GP/
	e1p10P+I5qowIhEljqLRuK7q8BLF/TQsZqtrO89BfRB2sjB17/s2sNNp3WYiCPBv
	ocVOw8xZ8lG+uqoiA61R16GgwCmt2Fi7lms/Wqhmw0kuzcp6lDulXtIYgXe66le1
	Qi5RZWN1VbKuH4hBchk9Pk4MycGkzAhP5RMQzS3hcNRvSmiHKIKsXWXV80MqqOyN
	AeS+kwCMdFudC0cD51m39hnXZB7gHHO3llWb5tPSDCV/qpPTc4t3lB/6anc4cal9
	LQl0gQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u2j9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:58:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e80385dbso290051137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783583915; x=1784188715; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wdOtbgBM/5Qv1dBByCOfeS0K8UvhwHlRKLvCJbRTSQ=;
        b=MArVtA5icLsumrMiJHcS0yEIPcLVtNNU5TLEXqRuNZX9oEHKGx5dij0slGvJPQvo4N
         7vE7izUXWhAK5tK4QFBYofg7Dt0MA5sYhY1oh2qqdMuHtJMbdr/lLOZ1Fd+o/DGAGXAP
         Yz+0qHpiFhZUBqn72T535ViaE3faqRAiH6uyg6IW1aY+YIwZ28+kp6zS4JTF9h5v7J+3
         KtXqpDGHGyEBL/OumBH36kexEJy9ndtub/nq00V3Vbtc/gxVQfJWpth8FORWExGcN6/B
         vxyB5JCHtWxNTNQUC1UNH1gJgKyWm1SiU9sX9aIhDndQaCCI0Q/KeHCOZxUOvgx2liEX
         no3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583915; x=1784188715;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6wdOtbgBM/5Qv1dBByCOfeS0K8UvhwHlRKLvCJbRTSQ=;
        b=CGOo6dkwB1FpX64QHtDb+2yBuVPAETjfI10RoXtBuWcPGcrolbGnEK5f9D+1mxeipr
         NDLgEvjEbY5fPBNZz44hOVtWddVI1VJ8LwhzvafJP3DWrRJxC2E2aRBhc3HkFFb2h0EQ
         Z6Z3hpM3HBtHFw/anxCu7iDeKimfWlSfOu4NKZ3AIcYLSV2Zhmj06k8wIRi0DlkhdX9c
         9KyPVucRtH1XfBSPcY5R8k8XF7L5fvZ432Wa97LzZcI0PAoAAo6+VI6jpVUZJjVoweOs
         tJGOQDy8GF/VBw/hwzKtjZn6Rjvpsji2GmLkKTN1DVVBHA+2MNy8ryoqbtz6JyxlIrgG
         dIIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXgnNxdMglVIfwPvOv1ixn/AUV5Cu9Ewq6CkfyzriYQiY8C6TkDRUmmcwLpm+aXJmuh4HQ8W87bXMz7UgT@vger.kernel.org
X-Gm-Message-State: AOJu0YzPnxu0XcKyQZd2ll+2ht2IJU16F5B+xct5rGzqTx3FiCbpaVCW
	9ECOVZCChGXmi78S4CUSPuzWRkIwzUY5xXEcgBrC4/PKCPbcLneGqjH0rHoitjyDXMAJypdjnnn
	unHbb+9QljlPQCJIIRktqIMWaTRLFlm6Z4oQYDuHeZ4HJaCrbcIwWfwGKk/YVed+Y4li3
X-Gm-Gg: AfdE7clvJJjEmcUuZimadUFnokHNMLn3AhP3t1y1Tqf3AjEvGakaJvvaWMDXp9ybSP2
	VoHQSmfntnIa7K/h+EBtobqebMAJ6DLM2bRxZ8cClu2WgIbhyY3WeOC54KunQ2ahfqHD8uiHgHa
	jiGAWMe/IzHT/hfPVjSS9Mfaevw2LU+Ns5oJXkafdgjwQjkZ2GKPPxJp3QbPSJcFKaaE/wirSkk
	MA3SLT5xTsGWezmZ0RP9vvCG2KBGZMAMY73bLlZBRcSwjDypB8Uw4YdvWvSDX24UynuF2/Lfasy
	ytxRzXuFxH4E2Biignl1SQv3Q4BdrNtFzZiSCOg/DZZh58xoejkbq+tbsESr/X4awxF+/bb8UOT
	dG8wthEsd+WZiepTGphXaREWC33nEBxLVefN913NklrZ2ZxhXU4RFz8ac/3qXMTIMSKUM3lWwPo
	B5lykBHzzVUJHHrHJxLYRh0DG6
X-Received: by 2002:a05:6102:c0f:b0:739:626d:4473 with SMTP id ada2fe7eead31-744dfbf230bmr3721753137.0.1783583915218;
        Thu, 09 Jul 2026 00:58:35 -0700 (PDT)
X-Received: by 2002:a05:6102:c0f:b0:739:626d:4473 with SMTP id ada2fe7eead31-744dfbf230bmr3721735137.0.1783583914774;
        Thu, 09 Jul 2026 00:58:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b007f68765sm2199158e87.10.2026.07.09.00.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:58:33 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:58:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD
 device type constants
Message-ID: <d7dqqj3qctbqdani5frdwpooppo2sq5odru6s4hxoj6d42sihb@fad3nuhunazt>
References: <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
 <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
 <2tu35aavp7sc2npni33ky5bve57idzy3bzp2pk7eh5lryq3r4v@gmm3dhayu4cf>
 <6f179f96-fdd1-4fa9-b26c-df7372eb6d20@oss.qualcomm.com>
 <tq3g6lpb2go4nen3ferx7kzs5g6sshc45ayfyvhjmc3rv3jv7p@fhixqlwbtooa>
 <54250163-678f-41e7-97d0-6596123367f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54250163-678f-41e7-97d0-6596123367f1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NCBTYWx0ZWRfX7T61a0mnfE82
 mBHZm4tQATiNMoU9T0OFA0F5QEY8wVaohCaV0csDie9Q2NsNeWjn6UemoAdKiByOm65gEapgvp6
 ihVrV3pivrBfohKTBje4Ff7hz/AJPdw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NCBTYWx0ZWRfX6B0bFhG3yAQN
 NKLDln+6veXNRp+iWWeqOYpR2C/sbRg4dtC2fUnXAK9xynYvo7WvaOxSXNez/DvX+zah//uFeLS
 0wZXQ5N9vI2fjWyKgIlzmRg0A4FsPfqn6V4rLLrQ/xR/xCV9tz/SqWfWqNfLqrqvbtcijRCcIYN
 zun+xoJz8IFmKH9PHmwyexA8YXiwJcDDD9EyvtMi6eZ43N/PNHSRvilLQZkosW/boHOGsxCfs/p
 xEB1bX7asBuDTtWf/BxYyAyEGuEvORFNuzLdwepZrB8KOYZyAmgtQMgKjuzMa0/v1ID3akSGD7Q
 br9Im36tdNxOHcDDeSPzOk+H+gZswJcuw9U4yjYD04VBbTuOYNb7pvAiwWaXw93uL4UJnMewpNk
 uMTL4envCfaJDeFSSFnrLk90pHa8xlUfz2iB2Q1MTtoPcJBAo4X+C3+fF/S+FNd1FD1URO17byl
 tKagj4+Ni//MCktYcdw==
X-Proofpoint-GUID: lzPsLXUWFwM20NkLDmpgX2NKpGrOHBWM
X-Proofpoint-ORIG-GUID: lzPsLXUWFwM20NkLDmpgX2NKpGrOHBWM
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f54ac cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=eKure5Gis9_f7ihs6EMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117891-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,fad3nuhunazt:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DE7E72E0DE

On Thu, Jul 09, 2026 at 09:42:04AM +0200, Daniel Lezcano wrote:
> 
> 
> Le 09/07/2026 à 09:37, Dmitry Baryshkov a écrit :
> > On Thu, Jul 09, 2026 at 10:54:26AM +0530, Gaurav Kohli wrote:
> > > 
> > > 
> > > On 7/8/2026 7:55 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Jul 07, 2026 at 03:55:13PM +0530, Gaurav Kohli wrote:
> > > > > 
> > > > > 
> > > > > On 7/7/2026 1:04 AM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
> > > > > > > On 7/6/26 19:47, Dmitry Baryshkov wrote:
> > > > > > > > On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
> > > > > > > > > On 7/3/26 17:42, Dmitry Baryshkov wrote:
> > > > > > > > > > On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
> > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> > > > > > > > > > > > On 7/3/26 7:03 AM, Gaurav Kohli wrote:
> > > > > > > > > > > > > Add Device Tree binding constants for Qualcomm Thermal Mitigation
> > > > > > > > > > > > > Device (TMD) types used by remoteproc-backed thermal cooling devices.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Qualcomm remote processors expose thermal mitigation endpoints
> > > > > > > > > > > > > through QMI. These endpoints can be registered with the thermal
> > > > > > > > > > > > > framework via the `#cooling-cells` property on the remoteproc node.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > The QMI TMD protocol identifies devices using string names (for example,
> > > > > > > > > > > > > "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
> > > > > > > > > > > > > `#cooling-cells = <3>` requires numeric device id in the form:
> > > > > > > > > > > > > 
> > > > > > > > > > > > >         <&phandle device_id min_state max_state>
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Define common TMD device index constants shared across currently
> > > > > > > > > > > > > supported platforms. If a future target requires a different mapping,
> > > > > > > > > > > > > additional target-specific constants can be introduced while preserving
> > > > > > > > > > > > > existing DT ABI.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > > > > > 
> > > > > > > [ ... ]
> > > > > > > 
> > > > > > > > > > Why are you using only those TMD devices?
> > > > > > > > > > 
> > > > > > > > > > > More constants can be added as needed.
> > > > > > > > > > 
> > > > > > > > > > Kodiak is one of the supported platforms.
> > > > > > > > > 
> > > > > > > > > What would be the benefit of having more than thirteen cooling devices
> > > > > > > > > declared in the thermal framework and having only a couple of them mapped in
> > > > > > > > > a thermal zone ?
> > > > > > > > > 
> > > > > > > > > I agree there are more TMDs but if they are unused for the moment, why do we
> > > > > > > > > need to add them ? Can we do that incrementally ?
> > > > > > > > 
> > > > > > > > That's what I am trying to understand: why the implementation uses only
> > > > > > > > the selected two devices, if the modem on Kodiak supports others. How
> > > > > > > > can we find out, which TMDs to use on other devices.
> > > > > > > 
> > > > > > > My understanding is that is an initial thermal setup. Gaurav will add them
> > > > > > > step by step while setting up all the thermal zones instead of sending a big
> > > > > > > patchset. And TBH, that will be much easier to review.
> > > > > > 
> > > > > > In such a case it should be noted in the commit message and/or cover
> > > > > > letter.
> > > > > 
> > > > > Thanks for the review/guidance. Not all TMD endpoints are relevant for
> > > > > kernel thermal zone binding — some like BCL and cold temperature are handled
> > > > > from userspace when needed. The constants here cover only
> > > > 
> > > > What if there is no userspace? Or the userspace is different from what
> > > > you expect? I doubt we have TMD-speaking userspace yet.
> > > 
> > > Thanks for mail, The TMD userspace implementation is available upstream at
> > > https://github.com/qualcomm/qmi-framework.
> > 
> > Is it?
> > 
> > lumag@rohan:/tmp/qmi-framework$ git grep -i tmd
> > lumag@rohan:/tmp/qmi-framework$
> > 
> > I found no traces of TMD there. Moreover, I don't see why QMI framework
> > implementation would react to thermal events.
> > 
> > > > > what is needed for modem and CDSP thermal zones on the currently posted
> > > > > targets.
> > > > 
> > > > Again, SLPI, ADSP?
> > > 
> > > Sorry, I should have said "generic subsystems" rather than listing specific
> > > ones. SLPI and ADSP do not require active thermal mitigation on these
> > > platforms.
> > 
> > Could you please provide details, then. What is cpuv_restriction_cold
> > TMD?
> 
> It warms up the zone when the temperature is too cold

So, if we ever get back to supporting warming up, these TMDs would
become relevant. Am I right?


-- 
With best wishes
Dmitry

