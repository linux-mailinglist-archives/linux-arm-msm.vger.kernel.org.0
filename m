Return-Path: <linux-arm-msm+bounces-94495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA70NVrLoWm8wQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:50:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3F41BB03C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE8A33040F8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9290B346AC2;
	Fri, 27 Feb 2026 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aywd3cfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idRTVBm/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CA834D392
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211020; cv=none; b=JKq/m4rbLqLl/R1gQBEID0Oksg/1CE/Wi6DJUUMydTKuq/1xf+IDC09VlJmESSK2fhyWi3DytwtuZ8SlU/l/Y8pby9IpA3jxfgZeUjLotj4qMThuJEgbt3tLcSDD6RHUcP1ls4ouYd3f3mPjzcVVc9TO4J2fs6mZ6g5lenzeRW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211020; c=relaxed/simple;
	bh=I1zDqyPuqDldOvtN2RqZkVgdgLAy/AoArdg7wkVIbQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSgnDmMUJDMjJ+WqPjey7q0I+5QdCaF2hPI0iM9Gr1i7lNVbF/JVTSVOY9EwNkoqo8HtkFkgW85MfBgG/Ezp2wcRXmpoh+DzBHbVGtXOJYEjDkE/0hpAsfJw+S15MbEEDPw/lcZvT9wJpbzJa6inYmcvZPMka7XdRWe8PWVQisw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aywd3cfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idRTVBm/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RGirsN1442330
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 16:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I24GMf7D5q0mlpnV6IQx2GHc/w3/CJuovqa3QQtDtu0=; b=Aywd3cfhB68F0txm
	zNjS282AypQBTrBn71dyn4Dv020xfhI3w7ujsBxW2e+SFIAPGHuVkr2k0SDf3XP4
	AINyd0bQA7WyRmbFhnSOv2gUzVTSm8eghV5u8A6/E/73iA5MA5OtwuZL1ft9NiXX
	Y6CLG4vEn8bNO2rG66uA4LbUbXSck4v9KXgOOO5ZiVy40mYrtANvlqjbSdjX5PQr
	PMFWrJsuYM8o/uD4fEEJ0QEtvqY/gtkrFUQcttwCPm7AXs36wM8jyJT3AMLM2IzX
	HZSJ/1i7thH/TcqxK0oRKid1l2Hx7/ZYam/bY0euWBkrlW9QVoVnj6IvPQKlpEn3
	hOAlhA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7ycdgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 16:50:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb38a5dc3cso226045985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 08:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772211017; x=1772815817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I24GMf7D5q0mlpnV6IQx2GHc/w3/CJuovqa3QQtDtu0=;
        b=idRTVBm/tjNfecAUD79mwvSQ0yTavN0AK2Eor7R+P14TudYxYpyZL+TPCXNGNwiMck
         L/b7hIRr9drA8hWZvrJiMKD5ZUnth1FtBDuLSORhxJx7YHhZOy83gaEa0mTFo/M+f0g2
         t9Jddd01sTeYrljEz8keMxhJz9D4qYqAhtlIZPXL9eY43lv81cibgyTT5GujhdGj1ZGN
         nCMEDLvYBVtFeZzGtZ2N2QrH1XsLA8bkB57grLdwTWeAX0hbuJgtw199Jy0KApoY2vS/
         NlQOXK8ezl8QJMV5ECWmgR3a9cWEwJMsw22UwhoRS4xPVliKulXMrIb8DIy5Ej/6cM0+
         sNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772211017; x=1772815817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I24GMf7D5q0mlpnV6IQx2GHc/w3/CJuovqa3QQtDtu0=;
        b=TYVrmW4W6+OoWj8UMqUMpTXDdyGW9valDK0tAxUU61Evp3boBcsabMgdqAcDlIUQkV
         f27O3CviTHqTVu+6++0vqFL5vXwtMRC+6SaMl9xJS3nwUEJnCFd54dIXo2LpAnpyE7iJ
         0X9yiGf+DlBeJ+hFC0F0tMi51HUK+wuSpjgN1Xfun58u65f/7v50vJiuEKHSCjD+p/3C
         6hh8QNDpvsltL12J0G2bz8v72B31Rol3x0/1/qR3ggpVuxD75BKl1OOoBNrhyjSE9Kg0
         sPWm3o/yB3Pq+WGy6SB46wi18W3NflEIa4brc/KuF2YlgcO6AGpej3/DKTBwtKJ3iRrv
         h9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUTpGxS9GWBgj/R4U9/xDAB7t9i9ZEJa8spM4ITWuU95+uBkuUONjV8JHo89lkZjTJEzVC9uIg4+hwmPo+q@vger.kernel.org
X-Gm-Message-State: AOJu0YwfU88VZ35g1FCkD+bqjSdlXpvRjAW9XagFNuwLgj2q1cuPJSrH
	6GPrz6A3MC9iMz2H4XhinOfPYfVTx0P3JkAYPD40MlJwEfV7F6z+Fv/3BR592sKct2IDTkJSEV2
	HBuEduIFj1cyYImJ8JTLaPTK62cO9LSMUAxiKFiOqerp0bVJ1+QGPkyT8E3x32PFY6EaA
X-Gm-Gg: ATEYQzw8inSs4J8Wcahexi2t0WL77sp+FFU1/ApXt41pYsHJ9oy4LkCTADde2XB207v
	QSFEJ21y5Q9ifHH48PQdaovW98O159FsnqLbpkG1xeb5uSdSuizsDigQ7CWmBuXm2XnmIWY/Kxv
	bkYgttmBHx2As8ts+cPP2JCWGExYij2SOwZwtDf4NRHC06tsS0gnbiDysBrS18uAk0CoQ/UfISw
	2rEuKBFW0KXuyCUKbw8mvjgpcWOnOC0ZAkfGv/ZL/fJjAGe7wLwO4Q78wa2BVh+927Z2YOvh363
	6jyM99yuwG0+D5Vc+BOrr5aodv7Ii6qXKE1nE3dhID/bRJf10HCzeivmfnp/aycrtKcaJ7JQJAp
	NF6RMi57i4WGvUOWCSDQ3rwBbwfe1bq28uI7jOg+Oy7aXu3DeagKZ5yibPBKVX91dJOrubpdez7
	5uEo0=
X-Received: by 2002:a05:620a:280d:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8cbc8e970f7mr305785985a.10.1772211017525;
        Fri, 27 Feb 2026 08:50:17 -0800 (PST)
X-Received: by 2002:a05:620a:280d:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8cbc8e970f7mr305781885a.10.1772211016764;
        Fri, 27 Feb 2026 08:50:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae612f7sm167054666b.36.2026.02.27.08.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 08:50:16 -0800 (PST)
Message-ID: <b79982a1-a0ab-40d2-a03d-606280c3a3b3@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 17:50:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: monaco-pmics: Add PON power key
 and reset inputs
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260227-b4-add_pwrkey_and_resin-v3-0-61c5bb2cdda9@oss.qualcomm.com>
 <20260227-b4-add_pwrkey_and_resin-v3-2-61c5bb2cdda9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-b4-add_pwrkey_and_resin-v3-2-61c5bb2cdda9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kGsurK1btCqZH56Sv18VWIkBWUe3kszN
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a1cb4a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=J_uYMOLApeVIcPsgZk0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: kGsurK1btCqZH56Sv18VWIkBWUe3kszN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1MCBTYWx0ZWRfX44fStvAOu3LX
 4FLyTG3r0CHELUYKXz7kVAmektMw5g11FQ1GMxUdZrtm5AzAsPwU+96a7HWymUZzNNK+9VyUrnV
 UJka18nI1SQF18GBbRevIRkxfR0ZE/VYflpWsm55DNwbponCvaBTW9rKHPerUlbiJO+Yft92XdA
 DJJFEYlBcX9Rs6lCRiEZFcq6QfkZMp9rF0ySNc4OEqAJWrXyeQj27cNpyyTRKmgchaqMrbVfOM3
 ZrIvKx4Eycyh/LaarJu/SH4dO5/HAYf+aZJFXLmOUnpXyvO7XnaOCg4D02zLEZrFqc9dVFs4b2V
 spAzzfPSMv3QUPzBbo+d1oRqwr+uMZpzZphlnlpYhld0pgkPLKCfP9ZPqEFYUMc4Z+3HEuZWjzA
 8dPADyDJrNBIOcfBL3gK+8F96qhIw2JHNneRz4AGCjgWWaMX+aKRAhcu+99vCvEaWk1R1mxFDBX
 PivKyfQIyZTKvJlqZmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270150
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-94495-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C3F41BB03C
X-Rspamd-Action: no action

On 2/27/26 1:32 PM, Rakesh Kota wrote:
> Add the Power On (PON) peripheral with power key and reset input
> support for the PMM8654AU PMIC on Monaco platforms.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Disable the resin as suggested by the Konrad.
> 
> Changes in v2:
>  - Add new PMM8654AU compatible strings as suggested by the Konrad.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

