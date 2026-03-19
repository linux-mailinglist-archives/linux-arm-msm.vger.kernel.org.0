Return-Path: <linux-arm-msm+bounces-98724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOmqCpLeu2lXpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:31:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D214A2CA508
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92B043024187
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E788E3612EC;
	Thu, 19 Mar 2026 11:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOzpidnc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WrH/+63Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3408E318EDC
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773919876; cv=none; b=lCLFHN1y55jiZq1MvMkJDvnEO9o4JcbPXZ7YrcOsFNR/OqSnnCmHOnHwkr0UVLPNoKLeGsAQ+IGmhfaaGXjeBVZ5Z2cOukoOzRDQPp/ulJU4OdFLtZmdqR1L8a0EDKm8ie2SGUWc4FJq6rNrZAP/+JAdRFhxlnlyZO2m5emIww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773919876; c=relaxed/simple;
	bh=6RmqrALrlNdyMFuS3WsguhkEzeFwcu2Mk++JT4DMms8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVIjlMAyquD14/sCkRf6elwLjvOj36MWN6Ob8kqdljvHDoEi/BKpst1iz7bCwfxSpRNIcH10g/g95hVr8APW1CttU3a79rxzoOyP/iGd4jq0a1TCgkun0jz8m30TUvIUR6PTG/8Mbp12tEy614LciqMNvEA120OdXcunhi19SJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOzpidnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrH/+63Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74Ldv3928891
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76/2vQui6iJk68wTK2OiKtt/O+mDim4lf/Wjqyl17RM=; b=SOzpidncdvHuVXdK
	wrKBNUaGDfEClTtyfV0EZhr9bNuxwmsMgZHmf+NCMBL30XjwX8xtbDzHkEsuhYza
	aMReyL97c1ZvN8jR7cRorB9YXnSWUdqBfHWStvSxMcLLcMIGblTeGOh50+QK7iM8
	k2vatlB4jo9h8RUQrybqBNCJYrXBmyvdCvlBCtCPKLkrgPhuomF/lja3vZyImFyF
	Kabfd5vzRiOp1xfv1HEYVTDF4idj8vx6AtxfyNImsMjEI02Zl7tOylwHWHKOI/qE
	Ksr6eAEvvJfEC31pPIpvPSweLM7S96vYXohyrPqxN2BGVBlp30iEJKomf8pcNPKH
	TbaLlA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1c6f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:31:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2a1f123fso3695161cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773919869; x=1774524669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=76/2vQui6iJk68wTK2OiKtt/O+mDim4lf/Wjqyl17RM=;
        b=WrH/+63Z2EV4gyWh9pvHwzpxLTKFGUKEqRqR9mxAvZqLOI+w4NwC+6U5nMl0pqgmP4
         tXPPqQL3kY9LNvcWBMGkZ5H81sOziyVGz+5/WeakTpIf15qyDJ0qvAGANj0bmgQ3vLBA
         g+RVeLVGWj25sLzNNx1YZvrr3JR27jrp7i2DESzskO0vmPNtl3GoNlBLOdUDs/KsYTaj
         3PL7FotBD2Uia9CDiFb3A9/tarUjGX5R8ILCPnussfdG2fn1fjdMzcZeJRpoEYdcWoiF
         2bTotvsXpG2R3TWtf0MXG+w2yQqh21REhwGkijLrnPQsKnf5iKYYKMWJ75l9z81EXgBc
         uHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773919869; x=1774524669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76/2vQui6iJk68wTK2OiKtt/O+mDim4lf/Wjqyl17RM=;
        b=j05EyeT68QSMxVWuUcKJn1Gv6IyMa0/JUK+v/yntOx6/S8oMf7Y23r5E1CyxT4CRsM
         iMUMSMww4Ajg068LrPmYzdZpJ5FJpFlZ0UJ+Qqie2HhW19tk99O4uGI888E+9An5xHlz
         AUhf5TEfDWXD79PGiy/FCtY6NQAImCSomRyQTap3WmZp0r5WdVJPbD5esWCZq+tVpG0S
         hVCXXaH50JCCYl76Fx9FoGnRjiqpHRCAEQmOqSjxgccq0P+NF3Q0xkWYKXwk0roNXo6O
         ZRVVnQN9VzcQf9+IJf5xDfFBBQ4cVfFUobg3uyw0lAo2EKzPGewmufh0psdIsClkxM5f
         BDbA==
X-Forwarded-Encrypted: i=1; AJvYcCXbgHZqdtf6K77vGfb6Rb9Cfvw9ZRgyvz3KYPNjrgluqrtoM+yAeYloGhb+nX+7mSJ+ABZOFZRnBUicNSRI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0fuPRvUjmm3vsdLKLxCDCBqOCHfpLoMdXxas9yaP4YQ8qtD9
	oIFAGJ26ZeLmphTkFpsWNeEpu6K5JY7LMcX4SB0sOUHOYj+T2yTKhUZEkTXU/bXHKqyyIzGXKt6
	k/7tBSsFHxbBmxPobNgfvAZst1BPuTm7jSXjd0V5LyNGy9akUDR4gA95OgkCL8mS3tvdL
X-Gm-Gg: ATEYQzz+XX07+r3oyDA54uC/4ut8+Yj/IXuT0sBOhVhmSRJchg3k7mj56bsa0O7IOlV
	OfrZSyWMB0ow7HuRN63Rve778ksn+JKmLBp8dUCi0gryT6ATvaSo+hnax2vwURy24YiTVD0YpSv
	2UTA8P1sDCEiy1bziIMBjL8U0zbKOcYnDVqYfjtQAJ+6Bbjrz/2RcK4Lux8wCkuxb8g6s9xdSo6
	Hs0qDRwmi2/cOtRdMaMaWukHzW9Mk+TdubBsJ9iA0B5O3qATY0OKJawzLCTArUJAQl+3VZOSP+t
	OuW5dI3Ug6edtgrbYImit7vQ21toEaktt6c/JZvDhy3RjdnNG/PyxO8q/ETNXBOtaCJY9EA90OK
	8cgr44s7FIqGUAup85vcy2o3qa0mCyqgRuRaXX8loPNMFOCENTRyZRbUs26apJz1dC7038sWcuN
	T98u8=
X-Received: by 2002:a05:622a:a87:b0:50b:2972:4bec with SMTP id d75a77b69052e-50b29724f8bmr12837451cf.3.1773919869001;
        Thu, 19 Mar 2026 04:31:09 -0700 (PDT)
X-Received: by 2002:a05:622a:a87:b0:50b:2972:4bec with SMTP id d75a77b69052e-50b29724f8bmr12837151cf.3.1773919868433;
        Thu, 19 Mar 2026 04:31:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f170e5d4sm428774566b.55.2026.03.19.04.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:31:07 -0700 (PDT)
Message-ID: <43ff670b-08fc-434e-8a84-1b781c216fdd@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:31:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add UFS node
To: Marcus Glocker <marcus@nazgul.ch>, Maxim Storetvedt <mstoretv@cern.ch>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, Daniel Gomez <d@kruces.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan@kernel.org>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <g5vlxrttgvfqkktlkhu4uzhtvnp3qtjcbr7l2uztapzqwhrsem@wg574xldh5ar>
 <cd9d5a7c-ec0b-4f0a-bac2-f747799bf295@kernel.org>
 <l5vwputpefdkweti56em37i5asrd3vb7pxhwlzir7webfuk3fl@afcqm3faq2gt>
 <D5I1G5K85QLC.FP6NF7M20KXQ@kruces.com>
 <f5676c71-9e15-4733-aacc-2d194e2567fd@quicinc.com>
 <srqwbf4teujrcvovxglsibvhtq6wpv2ojclf4joc6hwvszhbir@2gxtczxhqlc7>
 <c9304705-41f3-4b4d-97c2-acb0451b3fca@cern.ch>
 <pzujcjjo4izwjrmk2n26htdi2ye5eljagi5qcp3ac52y2fksxr@xvi4cj7b26tw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pzujcjjo4izwjrmk2n26htdi2ye5eljagi5qcp3ac52y2fksxr@xvi4cj7b26tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TJHA-R8q-buB6tJa5pIo6-sTK6Ccyrm-
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bbde7d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=lM6lPP4PU3o6MF_I6DMA:9
 a=pJSYWZii-99avefD:21 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TJHA-R8q-buB6tJa5pIo6-sTK6Ccyrm-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5MSBTYWx0ZWRfXwZ4w/NzylsLA
 KDH0tmONoKr5oitI4CGPPtdHOkq/Rhn2f1tUML6jxAK/xroIA5Cw3x/sQgHy9OaN1kA4pKOa4ZA
 8yCw91GdW/pNBIKlBTH9dYR9UgZMOaKUCFC3Sb45WidvAaegrLs5NJeCyxIzCzD6PYcL7u65Heu
 KAeCqyeB515cKEQv+5qTF1USPNn+w7zsyw8vZEvj0cUhlPyxG+5PYM9xYzPDiInzpu5U3VqGl9X
 wY1BtprMpzmJuFKMgaHHhhAhq6H2Hk3CrgaHUqoXN9EuS4LtwsKpRCltawKcxbZX8qWriXc0gfO
 dj8VmJA6Hy7HLLjhBEYetdIw1oaZNItYgTnbMqIlbdawWtgT/FiM2vLfJVnypAZ/wojOo4C/sMp
 pcsjwievYSOzM0QW8igx2qL4+1tQltHCQBWjcK5bvDBUPSYS7wxufTbHS/6l8GtLc3YRH8UETvo
 OFsVrmfP63H+pAZe5/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98724-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,1d84000:email,1d90000:email,nazgul.ch:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.27.41.32:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D214A2CA508
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/8/26 9:35 PM, Marcus Glocker wrote:
> On Sat, Mar 07, 2026 at 05:01:14PM +0100, Maxim Storetvedt wrote:
> 
>>
>> On 1/3/25 00:17, Marcus Glocker wrote:
>>> On Thu, Jan 02, 2025 at 01:38:10PM GMT, Wesley Cheng wrote:
>>>
>>>>
>>>> On 11/9/2024 3:31 PM, Daniel Gomez wrote:
>>>>> On Fri Aug 30, 2024 at 7:25 PM CEST, Marcus Glocker wrote:
>>>>>> On Fri, Aug 30, 2024 at 02:05:48AM +0200, Konrad Dybcio wrote:
>>>>>>
>>>>>>> On 17.08.2024 10:38 PM, Marcus Glocker wrote:
>>>>>>>> Add the UFS Host Controller node.  This was basically copied from the
>>>>>>>> arch/arm64/boot/dts/qcom/sc7180.dtsi file.
>>>>>>>>
>>>>>>>> Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
>>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>> ---
>>>>>>>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 72 ++++++++++++++++++++++++++
>>>>>>>>  1 file changed, 72 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi 
>>>>>>>> b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>>>> index 7bca5fcd7d52..9f01b3ff3737 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>>>> @@ -2878,6 +2878,78 @@ mmss_noc: interconnect@1780000 {
>>>>>>>>  			#interconnect-cells = <2>;
>>>>>>>>  		};
>>>>>>>>
>>>>>>>> +		ufs_mem_hc: ufs@1d84000 {
>>>>>>>> +			compatible = "qcom,x1e80100-ufshc", "qcom,ufshc",
>>>>>>>> +				     "jedec,ufs-2.0";
>>>>>>>> +			reg = <0 0x01d84000 0 0x3000>;
>>>>>>>> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>>> +			phys = <&ufs_mem_phy>;
>>>>>>>> +			phy-names = "ufsphy";
>>>>>>>> +			lanes-per-direction = <1>;
>>>>>>>> +			#reset-cells = <1>;
>>>>>>>> +			resets = <&gcc GCC_UFS_PHY_BCR>;
>>>>>>>> +			reset-names = "rst";
>>>>>>>> +
>>>>>>>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>>>>>>>> +
>>>>>>>> +			iommus = <&apps_smmu 0xa0 0x0>;
>>>>>>> Looks like this should be 0x1a0 maybe
>>>>>>>> +
>>>>>>>> +			clock-names = "core_clk",
>>>>>>>> +				      "bus_aggr_clk",
>>>>>>>> +				      "iface_clk",
>>>>>>>> +				      "core_clk_unipro",
>>>>>>>> +				      "ref_clk",
>>>>>>>> +				      "tx_lane0_sync_clk",
>>>>>>>> +				      "rx_lane0_sync_clk";
>>>>>>>> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
>>>>>>>> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
>>>>>>>> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
>>>>>>>> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
>>>>>>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>>>>>>> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
>>>>>>>> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
>>>>>>> You also want
>>>>>>>
>>>>>>> <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>
>>>>>>>
>>>>>>>> +			freq-table-hz = <50000000 200000000>,
>>>>>>> 25000000 300000000
>>>>>>>
>>>>>>>> +					<0 0>,
>>>>>>>> +					<0 0>,
>>>>>>>> +					<37500000 150000000>,
>>>>>>> 75000000 300000000
>>>>>>>
>>>>>>>> +					<0 0>,
>>>>>>>> +					<0 0>,
>>>>>>>> +					<0 0>;
>>>>>>>> +
>>>>>>>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>>>>>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>>>>>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>>>>>>> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
>>>>>>>> +			interconnect-names = "ufs-ddr", "cpu-ufs";
>>>>>>>> +
>>>>>>>> +			qcom,ice = <&ice>;
>>>>>>>> +
>>>>>>>> +			status = "disabled";
>>>>>>>> +		};
>>>>>>>> +
>>>>>>>> +		ufs_mem_phy: phy@1d87000 {
>>>>>>>> +			compatible = "qcom,x1e80100-qmp-ufs-phy";
>>>>>>>> +			reg = <0 0x01d87000 0 0x1000>;
>>>>>>> most definitely should be 0x01d80000 with a size of 0x2000
>>>>>>>
>>>>>>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>>>>>>>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>>>>>>>> +				 <&tcsr TCSR_UFS_PHY_CLKREF_EN>;
>>>>>>>> +			clock-names = "ref",
>>>>>>>> +				      "ref_aux",
>>>>>>>> +				      "qref";
>>>>>>>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>>>>>>>> +			resets = <&ufs_mem_hc 0>;
>>>>>>>> +			reset-names = "ufsphy";
>>>>>>>> +			#phy-cells = <0>;
>>>>>>>> +			status = "disabled";
>>>>>>>> +		};
>>>>>>>> +
>>>>>>>> +		ice: crypto@1d90000 {
>>>>>>>> +			compatible = "qcom,x1e80100-inline-crypto-engine",
>>>>>>>> +				     "qcom,inline-crypto-engine";
>>>>>>>> +			reg = <0 0x01d90000 0 0x8000>;
>>>>>>> 0x1d88000
>>>>>>>
>>>>>>>
>>>>>>> All this combined means you probably wrote your init sequence into some
>>>>>>> free(?) register space and the one left over from the bootloader was
>>>>>>> good enough :P
>>>>>>>
>>>>>>> Konrad
>>>>>> I have not done anything special in our sub-system to boot this DTB.
>>>>>> Changing the values as suggested by you also doesn't make any difference
>>>>>> to me.
>>>>>>
>>>>>> Anyway, I think I'll give up at this point, since this process is
>>>>>> getting too time consuming for me.  We'll go ahead with out downstream
>>>>>> patches, which works for us so far.
>>>>
>>>>
>>>> Hi Marcus,
>>>>
>>>>
>>>> Do you mind if I take over this series??? I started working on getting at least the UFS and USB portions of the DT file to work on my Samsung Galaxy book4 with your patches, along with some required modifications.?? If you're OK, I'll keep you as the author for the main DT file, and submit my changes on top.
>>>>
>>>>
>>>> Thanks
>>>>
>>>> Wesley Cheng
>>>
>>> Hi Wesley,
>>>
>>> Perfectly fine for me.  I'm glad if there is progress.
>>>
>>> Thanks and Regards,
>>> Marcus
>>>
>>
>> Hi Marcus, Wesley,
>>
>> We've continued to iterate on this device over at its thread on
>> Launchpad, and been able to get a fairly usable system up and running on
>> Linux for both the 14" and 16" SKUs. I'd be happy to update the series
>> with the changes.
>>
>> Cheers,
>> -Max
> 
> Hi Max,
> 
> Good to read!  Sure, I would welcome to see your changes.  If you also
> could send me your full DTS to my e-mail address, I could also test it
> with OpenBSD.

JFYI

https://lore.kernel.org/linux-arm-msm/20260211132926.3716716-4-pradeep.pragallapati@oss.qualcomm.com/

Konrad

