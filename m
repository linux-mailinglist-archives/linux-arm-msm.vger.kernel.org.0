Return-Path: <linux-arm-msm+bounces-109358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BDXNQ50EGqDXgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:19:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9095B6C95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29351302F0FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B8A472793;
	Fri, 22 May 2026 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSG/Aq5Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E26Q01lY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56075477994
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463118; cv=none; b=Sp5S2Y5QURyTMVDP+3w7SpX3V2AD8zBA7xOcLrM8i+mM1OcGAna8OrefOph/bF/GegtHtBGKY4RFWYanZMNSGbjW8xpQiN0IdG+WsvMy6OCRde8DghuoyAq6TeN1Z0eNnS94AZt5tfl4f1ZkCXnroE3xlg3sTrHg6ER3iDf8bRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463118; c=relaxed/simple;
	bh=ghSsUzXL6mQt9R7pPAb0Q7x6xgkE7K8eBHRojIg7EMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6YJe5+5+gnI9aK+xEDPXxLWgvr00Rjz7QAjvhbVkXMQzMPmBnontomKRT5NTCdn19oPTEuuwaH14y5ImkbiguxyhDpgFv5zvMyKNI6bgr2oEsLamlD/wYeicFKBg5hR2YO5GhdOISlFUbg/BO7G3Q2XRLH5Ae+gB9Vv8c3maHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSG/Aq5Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E26Q01lY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpee12125342
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g9xwrB635o2Tco+xITvF9/6o4dCfeeIrZ/2XNZN3wKc=; b=TSG/Aq5ZLHvsdsHD
	uddgC4ytLcmrJ9zxb6CWJrl/4JCe0eOAsgxWUSU0h38S0G2YRxhVtVrsEqngZVhx
	qIvT2NJ61XDgX93Kfy2JyAZLFHXmsP5nGvRXb60wofLA8iContnb3ZChpgRjAkr6
	gIwzGb0PH1CpIh6LjoFQn5zquOrW5noolIh0y0TjLzoBtDiym2FDQKivU94urFhD
	0r7JQSjBOdMo9Qd2iTx24aBMJssbwHr9c807cvkU2wMHdNS3oYYSlaNMQdBGgajD
	kWRCE8cnV2IrpAWO8VGT50HibeJ3bbb+3Vk8TXkUEMuth/TJp/yzf6aQt+IteVf0
	4tnuBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard88eyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso83883415ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779463109; x=1780067909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9xwrB635o2Tco+xITvF9/6o4dCfeeIrZ/2XNZN3wKc=;
        b=E26Q01lYfjqdpOo5MbbxqE68n2pPZKF157JIkqa3X6KcLfSYFnUN3JXwcgdlRoi2LG
         3YH0hE3AYAIaG+C5EFC/zYyCCsEQulXxk2p3V+kzaLVEG+628uqsv+4OabPZO+aadCUV
         6Xo5zycFZRU50CZdb1ovCiyedLsXECOjstBnOe/pIRdXKEltpGkBYiGAiUkk7wfZ9rOe
         uukIyWljaBHwNUF+jOZd87dlHoDJSm8GgEiqj0iJY74ZA10Sv4juzCZ0YnJw4HPF02EV
         o0Hv6QLQyB4WuPWfFUOaTxxpzRsAGwm5fzLxQDziWu9fzmnGCXP0du9pPogKYI0vu/HY
         +6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463109; x=1780067909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9xwrB635o2Tco+xITvF9/6o4dCfeeIrZ/2XNZN3wKc=;
        b=HTDKCYxk2JxBOJR0l8KYhDbxc5A7OxbcJIVePGSMJFZ0e8JZS3HhTh+jmFLvy6KRcb
         lrQXHoWILKxvmckzB5fBFrvUT3imcyLJSGwqoj4m0A52zSaSYnTh8ogvpi0/yR6mjZUB
         tDZo/g6XGPDWPP2XoUJUEXF+D80Co9vUsXLY+1eul9HRKsmcJDDQ1daBVGGfia970U6/
         m10kwvWiEI5fmi+NxsmG0tHlQw61OUyhXE/6f7SezJybQ0n2okUWSAeGFZCHwJ2NF49p
         66iK8WbMlWKpNCVOU13EarIXOBy850CxRz9vEz4yiEJ2i0qZHV9GLUsGJbC0T6SilvrV
         e1dg==
X-Forwarded-Encrypted: i=1; AFNElJ8N1Q2gzGQeAZd3ZKKTWs9Rha9P4S2CYsHwq1VeknJlmuMyriEfD+egF6ho+wHQX0Hjf/kXa6RbFLBJ/88r@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5eKTt70Qg1L/1hRptegIA+AgTGe3Xvjb5amRhoYhsDzl7CsrM
	y6Eju9Et7ZophCBC4hbvikpH3eWJzxYnXkABNqjBXmK5bovP482q/6rMl33gHjXC/XOzHPpK2cC
	2J9ZCSAhbEstXAIIcLR/7Axb8XiTGVKeyAUC7giOatLSb675pYPVt7jJKWD8Env86jOuH
X-Gm-Gg: Acq92OFKpx7ci317aGKsT7VAx0hWJ5VsU3VOlWqMA329oheVYxH4IvMs3gVNv8spUE2
	TTP7B+JAR0WoUh1fjvrigpDp5YGNaLsRPrKDKXaRhUN46pTv6w+uHb4UtawzyRrH5x3HHAni7pX
	K/QSFdsOOzQghyANfLxL7FFiZ2p9YF6ur66e+JA/hZJPvOsTBjeDu8cPbC9qKiBv+GqNKBXpEdh
	jICTtNvTXAT37QvRxIXxekY6v0GKCGl74WMHKtmXaYJvvL05SUpWJX2s/f4MCxDj6fvPJE1mS9e
	gZDWKCQ6IBzLv704OVRJjdQpdjsxIgMetHNgSJjiopfDMYDHt2IR482sgdArKz7taQCvYMtzxC/
	OIqv/irQmFvGiYPA3YTUGxVhV1FVgHUbUW0K3wLSvCuZ40uLQFdV2eA==
X-Received: by 2002:a17:902:e885:b0:2ae:803e:6c12 with SMTP id d9443c01a7336-2beb069c435mr44303065ad.6.1779463109025;
        Fri, 22 May 2026 08:18:29 -0700 (PDT)
X-Received: by 2002:a17:902:e885:b0:2ae:803e:6c12 with SMTP id d9443c01a7336-2beb069c435mr44302585ad.6.1779463108467;
        Fri, 22 May 2026 08:18:28 -0700 (PDT)
Received: from [192.168.29.82] ([49.37.133.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695b2esm19652165ad.4.2026.05.22.08.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:18:28 -0700 (PDT)
Message-ID: <e39b9326-1c19-44e0-8d3f-a299ddad22c9@oss.qualcomm.com>
Date: Fri, 22 May 2026 20:48:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Hawi UFS PHY compatible
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
 <20260518165346.1732548-2-palash.kambar@oss.qualcomm.com>
 <uut3u6djc2dc23aznjxdqvkehpx3ooa7eknzjzubnlmylwvxxb@aow3lpjurhnt>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <uut3u6djc2dc23aznjxdqvkehpx3ooa7eknzjzubnlmylwvxxb@aow3lpjurhnt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a1073c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=p6nWuE1qLcVxvtXth5uE9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nJdWcSulx8WbVkVVkBoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: R2itlGYEeY_Mwry690oLtPBhad1bJjXc
X-Proofpoint-GUID: R2itlGYEeY_Mwry690oLtPBhad1bJjXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1MiBTYWx0ZWRfX4Od0xq2iv4Rj
 14XEQ19GObLpCiqj0JUMWyYTK1LyOJsuU5HoGdXQGbGsFaMYtv3WuJ+mfmgHh6LMsOu8pf9HClk
 IaYqmbee3xdGa9LYh4xhFTY17gaXkq/pd138HfyUpmEAHNJZUoqqBHZids1HbAtRHIaAB7Ao523
 jvNWUrrK/qlPuo8sAPBqIdx/ZYasxz1XZXA7JBTlcT7PdzrrDpK1mMJrnrdWMQWuP6gtX3d+OKB
 A7XuK3P5VaIIIeRRiZ7lnwJTcR4ArHC9yJSACnuttFf/EySJ8GIUn9hfc/vUeCNgtuXF6wje1wE
 iz2A2A2jk13FEPnwDz41kdFJd/ZCJ05ccX7J2+7fsrb+TQxvHkJkc/fvv9elItiByOcYJuEi78j
 933Ft9G5fixkUeBFcXjdm/TIz4Bqkgi57LaQg91bqUUqz28DYfau4655EDgXdWCvqBm2+bt49dB
 r+msls/xCVLGoGYuNOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220152
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109358-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A9095B6C95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/2026 11:35 AM, Manivannan Sadhasivam wrote:
> On Mon, May 18, 2026 at 10:23:44PM +0530, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> Document QMP UFS PHY compatible for Hawi SoC.
>>
>> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml       | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> index 9616c736b6d4..2326dcf38a46 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> @@ -37,6 +37,7 @@ properties:
>>                - qcom,kaanapali-qmp-ufs-phy
>>            - const: qcom,sm8750-qmp-ufs-phy
>>        - enum:
>> +          - qcom,hawi-qmp-ufs-phy
> 
> Don't you need to add the Hawi compatible to the below check for clocks?
> 
> - Mani
> 

Sure Mani Will update. Thanks.


