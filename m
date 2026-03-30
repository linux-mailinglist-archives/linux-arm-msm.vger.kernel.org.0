Return-Path: <linux-arm-msm+bounces-100763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BecHcJTymkq7wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:43:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA17359955
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69AF1301980B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F9F3BF66E;
	Mon, 30 Mar 2026 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVTye842";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnFk3B0B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7402D3BED17
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867326; cv=none; b=N1Lm3cIFPDPA7wKyIHqGwMuF0f6BMc8qWhWttZ9TFN/rRgPkwn/d3ggHFXSQELzDL4VwBYg4987izacolFpXGoB5MqD/bZA4My/koBpxAzInl/6oBHkX6SMKlIwfWswfUbEhnf7CqqytG5sXSuDziahPPmvwhtiwUDAB94CCP6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867326; c=relaxed/simple;
	bh=BmlXlkoDN7X2vpJ4luAewh+ZyXBrjwVewWbNKzh/Rko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJwx7EQmADcnUPeWzhSjBE9zSVQEl4GvcCNKZGD7Ms5oE9KTl5xNmiBfrp/K3gpPpPyTI1g7XcQ85+ISf/1ADzv0izfyiOdBHPs5sb4fo5ZDOooo3tUatKhXgy286h7qnNPr9WPGS6ysTGUB7f69OmYHILz0+KDxKjtan3QaQQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVTye842; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnFk3B0B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9n9xf3721886
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZ+rs/NWyZIcXsS6JKpVZv6HBYZVLDLy/+xYJtsnaEM=; b=fVTye842iej0oo/r
	9zJiEdhD3jhz7z8jLvuosn+N/SyNMrut9sZoym14e24HMe/+eyiokM7B8VMqdts0
	qdqNI4C3cS6TaTDKbEKAdP/UvEM0P9qaoRgbSWDiPnJotwumiGDZqdkx3zDUVkan
	0tV3zOLTRZzLnYVvJODo6qblkT5BECnJZtjmmtX9mw4sqWM2PCUPCGpAAMkzr1yU
	rxoHUduhnijgHqrnavK62vUZwuCa5J1mAUUviAV3g0jvI2bV58tQVLJA71SJPtz9
	Rmv5CszMWWgFgn8Y2GcWDLKdJcqFqZ+E/oxXJRgJTkyiWn94In3tjgSEmJI/NVhD
	plBCOA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmr6ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:42:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b33a19837so17807291cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774867321; x=1775472121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZ+rs/NWyZIcXsS6JKpVZv6HBYZVLDLy/+xYJtsnaEM=;
        b=bnFk3B0BaeL3Ms48HKdtUnjVP/MAzqBhECnVRqzUqk/LedY2TxYIi59NJAKFzFlBY2
         fGhEGOv5Q4bsx5dQCDcts0Eid7AOIBvRhA5fLR+moUN9NQ3tV/u0rtPgTvWXai5pUkfW
         mrKYE36pycuXaFU9lLhBWJ9yJxjcaADHHE21WXUDh7d5+TbsaAyuY9FQxuPK50qYWC9C
         f8ybcr0s+wMZ6By6BOwp2Zg5/yk8cISQ2cLmx4uUXaci8g/9vGIjLKgoqRgWXQRugZHh
         ilh+DTWBM8UNPG4UE6z9C/qS7IxPMMbLzIeQ1/e36Ma3KTtByYB7ENpH7gXlfUjIJkIc
         zeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867321; x=1775472121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZ+rs/NWyZIcXsS6JKpVZv6HBYZVLDLy/+xYJtsnaEM=;
        b=THFZcML1GlfM0KNLGcAj/m2t/jrC+MtSO63Y1gOtov/zuhLsc+CG/Cen7vhKa/ZNr/
         vnTBXP1ytb4CGfIiiNg6O08bLwTfOVW+9MtlclaU1ZHIMjH1kXZFjIc+PKcobLPpF1jU
         gCcjS+YyfuttrNCCiTnCl0Ilqc0Qou0IDaM4EQvzMx7K5N+LNLXi9UupL5sE+l+CksHu
         Vfb2D4wTAsqbB2VR26FQtzX0O+xn9FGvxzMToQ16Q1cHWDzD39E7EJ68G4+q1D+w7w/G
         mRj4X5GHJChh58+hitSAebGu2DDlm3HzXgA2tr50ifGAXkf9m4w3XkJhbilQXEoLLrCR
         DBCw==
X-Forwarded-Encrypted: i=1; AJvYcCWtxtV3Du9apnPupt6sKqyBCjNLguSRoAvrUlNl6bNc7GwBXpKZR8WdE/Yk8Sw5A6rAOnF514uyEFCA8naL@vger.kernel.org
X-Gm-Message-State: AOJu0YyJhjBQIebO8g/PnWMwt7ZV4dtKjV6Y/NRWqfg0WHdlTBB7IzOq
	M5FeMxDnrPPFwsuODAqSkQbq9oqkaJT1qAEMIvspucwF6OZSA81p4O4fDqoF/N8WoohsnHfo1WR
	EIZ5bIw2YnbpF/exTY4ugEGbnJ71Jj8vhItuIeqV8qmI8EpqdboKBg/zWR6YHLi1IaVca
X-Gm-Gg: ATEYQzxfoVg3wg0dYMKrcR4SA66CZUpGiK+z0EwIixpqmPeCIbNfG9k8cJXZkwOPFct
	FCfDNxenm1a7j/yd2b2m0PSSJ/sbAa7doFkWRG9lSFE0YLEQfmzJKriAajp43BMTjWRlKZYEZqn
	i9ZHAjUzDEDxrThx9IPvPfJ1pAPJYPBltbw1FpA5PEt1+WrMsuohxfRTxxm7bSXMRazfOFbDqk8
	GYqFe/QbVuFT+Os/34beZ7/lx6aHPh0C3d80WCQVoDNNCsWCb0TDDxaOLJheea98CBaxxKUxC53
	oY9oFzpYAbcr/bwl3YbxGunO4GDwR37s5P/BkbBALu+w/4ii/VuIJjUapMZPzShZ5956olxsKz9
	as7h2mo9XXj0wykYSAdtZlRJvErQV0jUCaJTDapiEq5eb6Nl+jTK0+6GEplkFaaAs+6TsTkPO5U
	xAjF0=
X-Received: by 2002:ac8:7d15:0:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50ba37fc306mr136817871cf.2.1774867321381;
        Mon, 30 Mar 2026 03:42:01 -0700 (PDT)
X-Received: by 2002:ac8:7d15:0:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50ba37fc306mr136817601cf.2.1774867320872;
        Mon, 30 Mar 2026 03:42:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76078a28sm2344628a12.22.2026.03.30.03.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:42:00 -0700 (PDT)
Message-ID: <12ee3569-16a6-4787-a874-bc802a50175f@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:41:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add Samsung Galaxy Book4 Edge
 DTS/DTSI
To: Maxim Storetvedt <mstoretv@cern.ch>, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: marcus@nazgul.ch, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
        abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
        kirill@korins.ky
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
 <20260322160317.424797-4-mstoretv@cern.ch>
 <881975ea-cc16-4b26-9672-731c146a1ba8@oss.qualcomm.com>
 <40e31e2f-84ff-425c-a7e9-f2df4210ddbc@cern.ch>
 <892fe03c-f3d5-4b6c-b821-95dad55fdade@oss.qualcomm.com>
 <f6323f22-27c8-4ae5-83d3-59831b62b5da@cern.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f6323f22-27c8-4ae5-83d3-59831b62b5da@cern.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jejKLS5VBtwVxc20Z4oXp2LwS-BbBgQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NCBTYWx0ZWRfX8ZPOBWkcQhWn
 1bHpE+Hnhssly5S/pOQIEkh/Z1HgRULAQeAkkaL7MywwMa3KjfEdHwUCF7slfFGW7yQw1uJR60l
 9q2Yw5vpA26nl9YMDmGTrmmwuNjS/S7l/SRjCoXzxpwW8leSJpKAuqKD3Rcu4wt9jtFAxMgf+Db
 E4UrOciN3yU4V6G9tMS53osVD5jLG89KzDkB+M/GVG+Q/GvWdG2qtSBgtk4Njcbza+LYr1bbGWF
 YlPLpTCHxDYaUPz/mOlTPJkzkjD9+Jl+ACH+zu4wzn2Hjif8YupZoVETdidPTpFFvddyVMEzK98
 DEiyLDtoZ+vBly3FF4nkZ8Cij1Dh6s3kN+r186j2DpIe1pv9dtnMiBSJ5NcVRRmRqfdtXGlr4QX
 bMcL9A73gK5Du+EumA2UjSrjlZz3UcL92Y+wExVwoacb236CRRPeWYdU6/Kd6YVQ+oS8gj8SLO9
 Z62OY0/mpx8tnkwCeBw==
X-Proofpoint-ORIG-GUID: jejKLS5VBtwVxc20Z4oXp2LwS-BbBgQe
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69ca537a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=l0Qez2ZsdLq-0CwC96kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100763-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AA17359955
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 7:30 PM, Maxim Storetvedt wrote:
> 
> 
> On 3/26/26 12:33, Konrad Dybcio wrote:
>> On 3/25/26 7:30 PM, Maxim Storetvedt wrote:
>>>
>>>
>>> On 3/23/26 13:17, Konrad Dybcio wrote:
>>>> On 3/22/26 5:03 PM, Maxim Storetvedt wrote:
>>>>> Adds devicetrees for the 14-inch and 16-inch SKUs of the Samsung Galaxy Book4 Edge.
>>>>>
>>>>> These use a common dtsi derived from nodes that were able to work on Linux
>>>>> from the initial Galaxy Book4 Edge DTS by Marcus:
>>>>>
>>>>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
>>>>>
>>>>> combined with the ongoing patch for the Honor Magicbook Art 14, and its downstream by
>>>>> Valentin Manea, which shares device similarities:
>>>>
>>>> [...]
>>>>
>>>>> +&i2c8 {
>>>>> +	clock-frequency = <400000>;
>>>>> +
>>>>> +	status = "okay";
>>>>> +
>>>>> +	touchscreen@5d {
>>>>> +		compatible = "hid-over-i2c";
>>>>> +		reg = <0x5d>;
>>>>> +
>>>>> +		hid-descr-addr = <0x1>;
>>>>> +		interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
>>>>> +
>>>>> +		vdd-supply = <&vreg_misc_3p3>;
>>>>> +		/* Lower power supply is not enoug to work. */
>>>>> +		// vddl-supply = <&vreg_l15b_1p8>;
>>>>
>>>> How should we interpret that?
>>>>
>>>
>>> This was in the original patch, but using that same regulator appears to
>>> be enough to also get touchscreen working on the 16" book4e. That said,
>>> it still does not work on the 14". Something to revisit later...
>>>
>>>>
>>>> [...]
>>>>
>>>>> +&panel {
>>>>> +	compatible = "samsung,atna40cu07", "samsung,atna33xc20";
>>>>
>>>> I think it'd make sense to move the compatible from 'common' to the
>>>> 16in DTS then too
>>>>
>>>>> +	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>>>>
>>>> this matches the common definition
>>>>
>>>>> +	power-supply = <&vreg_edp_3p3>;
>>>>
>>>> ditto
>>>>
>>>>> +	no-hpd;
>>>>
>>>> really??
>>>>
>>> One less thing to debug while previously attempting to work around the
>>> "illegal link rate" error, which turned out to be related to eDP 1.4
>>> (similar to the sp11). I've kept it as-is in case other SKUs attempt
>>> booting from this dts, such as the x1e80100 16" (as it might be getting
>>> a black screen using the current x1e84100 16" dts, though this is not
>>> fully tested).
>>
>> So do the 80100 and 84100-equipped SKUs of the laptop come with different
>> displays?
>>
>> Konrad
> 
> So far assumed both 16" variants to be fairly similar, though one
> valiant 16" 80100 user over in the debug thread did try to boot via the
> 84100 dts, with no success. Instead having the screen go dark after the
> first post-tux kernel prints.

Does switching to the generic edp-panel compatible (which will parse the
EDID and try not to be overly smart about it) help here?

> This was strapped together via WSL though, so could be there was
> something else at fault, but strange it didn't at least fall back to a
> visible initramfs shell.

You mean the kernel had been compiled via WSL? That shouldn't be a problem..

Konrad

