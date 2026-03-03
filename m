Return-Path: <linux-arm-msm+bounces-95223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJzbLKdtp2ndhQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:24:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AEF1F8541
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3484630547E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 23:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65A033D6CA;
	Tue,  3 Mar 2026 23:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPAAwHJi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyRR66XX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950293328FA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 23:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580260; cv=none; b=CJPgot5kdZlEZTQb6nm2a8+bmBi11xxguMBqd2XKLdeC1XuykEHR4Kwkt3YkELrAqE9/NuWsKH11dmAqHW7xxiNr+QVjj2O0D1LYvYQuTlm3H7HYE0z80vtnTPyHBEJxyzxnuzW/MPVD9XMPiu0r5XlTWhLWBd/LrqSQ+el41bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580260; c=relaxed/simple;
	bh=PAutGbbNgkbxJt2N6wJu86lYzCYZzLzQgxKPxhQ7hQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6WmFPCzTvUH441+Qi0fhN4QZFUKpGg0aAMeHm9nLIsV/WfC+VE0DGXtS4f40G46KBSIEIMiOcmjUrxWrCS/sfUi13k9//eygM7IvrOAsZUyk95n18fS+yGMTJVRl/K+pz8BfLqQ658cagRAMVwfPv3YGoA7QPnSDfcH0tG7lBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPAAwHJi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyRR66XX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H1Hlk728575
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 23:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Agoo+WTV1u1Y1+T6EpYfbr8SfAFW7L323mOuRNku9gM=; b=cPAAwHJimnz9LQei
	f71pq1fgbqCSGr7cs8PMtxGBBo32WkyTIFkz5ocAxNAaljrVE/9jNBVaV7bUHy1B
	ThSZ7Mz25sLk5Ac28XQChxZsYXyg7RwlpjTXVHyePQQEKqNJwdea/81Q5XXuNos+
	sOAPlPHNkBW4e6jQJ3RS7ty0KQBe03lUJh7BGwaNRw1ayotCdKZ7ec2mDWi/gM9c
	0fHIzlroJX+i+D0kdhnMotHD8odWUsVVoIwIvjDqpL+gBciSRHOrDlLcBNJ2KzwC
	kIQExAhfy57duxnQDOgaWYhTiQebHR9Asg+K5hvU0H9USzWlCwk4CsWcG4sVYJ3u
	UAtBLQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fujd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 23:24:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2be07cafe1cso40563595eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 15:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772580258; x=1773185058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Agoo+WTV1u1Y1+T6EpYfbr8SfAFW7L323mOuRNku9gM=;
        b=fyRR66XXZikDa+ZmTnxF6cSRbd0VAse3JcFJueAQ0SAr3JcjmGVwZpPo9WXv31Az2b
         YhBWJ4bSVMmJHRhvm+jeNwe6bTNJUn71wHddxpYVzyVJ6o6yUiyutk4BCdrYntUq48eZ
         otcOEfFx/U72C6o2Oq/4fxtuo/U0+q/fWRuhxYhExQ8FY3BZYmaiks4qUt89SPLLb28E
         8d9EJTXRifFYOGNrVIe9T0Ha5Le8O5TaIIpr32naPAPkG+qVDrmnqhmpHko80nI+uAlN
         HQ+9CmJ+Z08x94Fzloqe1nNMgSQzHqNpieibfvP67NNqTo2cs4X0nXE6WDuUmGbXpFv5
         9m6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580258; x=1773185058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Agoo+WTV1u1Y1+T6EpYfbr8SfAFW7L323mOuRNku9gM=;
        b=BRIIB25CkXS/uGk+G2y+C11SBTcYGQkgW+cNE5pn5nvjFx8Pdg462fb+LhYyhHpOfU
         Fk/9caQB17x8ZZ1d6Comc5ks9RZNduoLaLdpvNB9yzcfF2HnlwH1xsLuMRNbrd11dKXn
         ZIgMJYho6M146y8W+LWn+1twffCOmZZ8mxM7x7zUfSlXOCnNirx6PJmCW2xRTMD0BlqO
         Dmx7NVylSYelco5Jt51q+wUS2+gEpORtnzENOnhWA4l/R8mHXLcSjLLwPTURebB0STr+
         TtTDm3OW/4kyN/1Seniy6JWySwVP+5iuvkpG3isbIWjN8xQ3jhek/4wHnmSSxUlLDQKy
         YEvA==
X-Forwarded-Encrypted: i=1; AJvYcCWmmUlSQs0zXcQ6ju/2fYvKEh4Pda1AiZmIHCK1XXvIDq0fHC1qLj++dI9QDx0mOMKEA02y7EPBWXNfN6sh@vger.kernel.org
X-Gm-Message-State: AOJu0YzMxN5+9++6b8RVuGdf2x2tXbNikN5F58b+G8UdOZthJ36FiJyr
	xLfG23Fl109sIBNV/WwuS384gVJvLg1Xmvr9yyZXLY3H+1a2dpRs3YmLHR6iloFJJmYCwlFW/X6
	rx/iaIVCFfA0z19FMOWu+5RnpDeFoTAj/xOirvP5/vGfZ0VbTtyzvOqhBg45Ay/e8bed6
X-Gm-Gg: ATEYQzwqmJeTiqUzIyCBYYtz9EXnufPWrorYT7y4HDlRmC/UTP7iErOQwRLsEUGdT1t
	A9va2dCRn5kD3s9c4LWw0XvAN8AcFLuEvfgYxdBg8DargozPLEbCjKljL6WEXwRQ9pf0AJsdWAv
	ZblVPwC4a72b18KRu0aJyHLHd25aIOmSSNYY4resQm+OM1Ze+mmiHh8IPJiLLkmg48kREtyy29D
	LWBSJm1kyKDB1Dz4gmkDL1S6mq7nU1bL8DqEl5h1fc4m06mILm1eNPhTKYBirYr3G4bSNpf1jMr
	7fAp7FyWUR+Zr7coEZIV2A+8QX/n8NmSuqamvvo0bmBPV1OGYQwza5RZhgBwIRr87NoXBGW/INI
	MnXOFxbj22HEI2HosqaEtOhXHax4um6Le9vAkTltiBMv1RkqB7Gm0c9u+v/FrfGFIVuILtI70jO
	Ty
X-Received: by 2002:a05:693c:2c0d:b0:2bd:fd23:72cd with SMTP id 5a478bee46e88-2be310a2cb8mr18037eec.26.1772580258132;
        Tue, 03 Mar 2026 15:24:18 -0800 (PST)
X-Received: by 2002:a05:693c:2c0d:b0:2bd:fd23:72cd with SMTP id 5a478bee46e88-2be310a2cb8mr18025eec.26.1772580257564;
        Tue, 03 Mar 2026 15:24:17 -0800 (PST)
Received: from [10.62.37.55] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2c357d6bsm788690eec.20.2026.03.03.15.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 15:24:17 -0800 (PST)
Message-ID: <f83f616d-9114-426d-bc9b-42ddc839686f@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 15:24:16 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <yhatx2iuoofvsqpu5da7ohpyvzhc2y7uq3bhuhfuv6pkfpqrnz@75xei3bawzza>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <yhatx2iuoofvsqpu5da7ohpyvzhc2y7uq3bhuhfuv6pkfpqrnz@75xei3bawzza>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a76da2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=h69VVFRyML4NUzg0ml0A:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: W3vJOx_vspUcau3JpPSPlXEff__GCn6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5MiBTYWx0ZWRfX6tZuqsd+nmMa
 xnMKJLiLDo6VXsTwKRKTMZTTJQ3p4PJ60WAEb/I7zxY/p3QzLzWkxQAbsgp9oSPC+sfUQd+8q3b
 7Bdqg/4g5+C5kJ5aO8gqgs+YLdVKUfoCt7SkQsJ0NRrmdyf0VpPO3bA6LjQybLPIzothO5Ecvkd
 sT9jWPG1JIl3Fwc99LIzDsmKetWKSEnluLPTkYIgBRFiHNjtfKJmPmB5Iv1sJsRb3WprJOKLkrO
 kTYWrP8frtg1bqGPu3dSyBTgYVYq0ixpWYVnuIMoxcS7e9b4FtAPhzF1xqTP/oyeXJb7+fH86/M
 apxNMtI/lFBcbvRJ/gGyva+Tm4B4AdhKNfPxPoXGqZ4bKsvE0+TMwRuk3gbGLVoniEhHJj6lzuK
 vueBXy5Lrr/2lMdGWbkV9PmFiGrMAtsgzx3ATZUAZUz3V1Z/nDTytJR6rmtbRXG4nyi9gGoyxU2
 xNXAC96Yt/nEoagnTSQ==
X-Proofpoint-GUID: W3vJOx_vspUcau3JpPSPlXEff__GCn6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030192
X-Rspamd-Queue-Id: 17AEF1F8541
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95223-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/3/2026 2:31 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 05:51:24PM -0800, Vijay Kumar Tumati wrote:
>> Hi Bryan,
>>
>> On 2/26/2026 4:34 AM, Bryan O'Donoghue wrote:
>>> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> As we are cleaning up the PHY device nodes, we should consider fixing the
>> power domains as well. Although TOP GDSC is defined as a power domain, it is
>> not the power source for the PHY devices. Rather, it is the MMCX, MXC and
>> optionally MXA based on the architecture (Refer to 'Voltage rail' column for
>> PHY clocks in IPCAT). There is no
>> parent-child relationship between the TOP GDSC and these in the clock driver
>> and it was just working as the required power rails are getting enabled
>> by/for other MM devices.
> 
> Which domains are required to access CSI PHY registers?
PHY register access requires the PHY core clock, cam_top_ahb clock. So 
in my understanding, we need to trace these clocks in the topology 
backwards up until at least the RCG, and all the voltage rails powering 
these clocks will be the required power domains. Having said that, just 
register access works even if the voltage rails are configured to the 
min level, which camcc does already.
> 
>>> +
>>> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>> +    };
>>> +
> 
Thanks,
Vijay.

