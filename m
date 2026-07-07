Return-Path: <linux-arm-msm+bounces-117173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hkn9HBmyTGouoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:00:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BF1718CCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:00:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fcckQYcR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kwr3+LCQ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117173-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117173-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5589230053AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5B62F0661;
	Tue,  7 Jul 2026 07:57:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B36175A91
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:57:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411030; cv=none; b=UYJv/zSUWJR7NLdYlk0XsEgEye6acP35KzMPovG4wJw1Xjs0e0yREGUIs3hHgV6BgbKjUW9MLy4XUov1DyqY6086pvhYYsqVekR+qUTbgruYfSqWiCcNRaoZsB0MVjvxcIIzUHF8vq3wHUh+HZYd1+biMuQzuPeQASn51NRnzbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411030; c=relaxed/simple;
	bh=7c8SCLDxz1//Ut0q3RLGJjkmqLqxbMz3thHlFN0cw98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tC2SFRsrovPjkbuqoqVP8sN4NH2SUQ4oCd+886V2U9l8EKvWu+Y1Fklw/HP5LgThWv1Cix9zlQ2anObR149FL+Z6CMQWShGbOXDOjv4VklJNbpllZD5kGPbo8kX8fd9sYE6jLfiRPSR/A07zt/g+Zf/qx8cQugUmLe3ae+zDk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcckQYcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwr3+LCQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6677NKIo3130408
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YpaEdMecakz3winsJqyzZ3JM2BmdyWxm8Cl9jEyPXA=; b=fcckQYcR8YaWsCne
	8OMkkL6BP/ynJXTTEAsp4qAeFWCCSjtyss+7TFUrogT8Wim7hJYNpi6snApgBjUS
	TKjFsDx7XkHgKeZK9JiMftH9grco5VxkAWTNiTqHxZWEj/V/oxN0dfTwapDvVIWT
	6bePbgvZVPdMCveLWJJfaMIlrvyLikhUIiTSt/fsGYitYyYoUna2vUuaPvez1i0n
	/3jqUl9vCs2hdmUit562G2/k6yzexF1+ZLjJnm5PTbhUMXmejpIIW1bSTc/kxYf1
	EkBuvtu5Sku3r6Y8ZoITOOI0bomB3zl1EUtfCs/cVdSxe+O2z4PmKrN46N5ra0a+
	idONjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11r3p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:57:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c08e9c344so15485481cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783411028; x=1784015828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YpaEdMecakz3winsJqyzZ3JM2BmdyWxm8Cl9jEyPXA=;
        b=kwr3+LCQQwO9mutqvygdfGQQx8txZaCEe3uHidIl7ZDwM+z/C2VeDcpGzc2oRB5Lo8
         ZeE3po2kPJeplXmjLzf/FyBxsa0I094B9Tpd4dDLIzkCfzRscy2UDXOLy27XiEjVyv1a
         aN/9wE2ICQCXfP+wHDEwZSPhYvTnetbM6ZXx3EBOC+IsstrdNLUPueAXILtPrG57lmH4
         8N+va0rqFBXjCSBictphl1lLpVIfB8MSYRHHMJs7qiLZJPVwJzBD1iikQEYhDdveDBMj
         Z1YnmFjfFaVFFUUv9UaK4NjtQA7B5BohcisiONU8sVG48Wjo+pTKtdOLwSu2wCp64fEV
         AdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411028; x=1784015828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YpaEdMecakz3winsJqyzZ3JM2BmdyWxm8Cl9jEyPXA=;
        b=mHs2qbf9TvV8y1gBTjxvdk0H5BoSBA5WQ5m7DUrPbTFyzVmLd6oYEvhcLRcce2Qxqx
         7jXDfvnlStj4mRLRXhbLDekT5oRKzjEpbVDlO5Pk5qaCwe4Vy2mwUenF9aPs/HidK3c6
         0GOKnmEz0+riZC9/os5sBGls81QmKblBJUWFHkYmiJhgaDB6coPQht6JbfG0yMfwcTue
         my5Sl4JXQSoA6oyL/3mZ7Bqweb5HyqoQWTNCqvocKkFgYKmlSoL2+WBqcoQgkSLIBn6P
         Lr0DAQG0vdeIfN8wqeWtwzRD4BMsg0m+sQu4GPMKOqGnCxYdq6/CwkyiKuuEzqvNsdeb
         Fubg==
X-Forwarded-Encrypted: i=1; AHgh+Ro80EIA5GJ2HxcUNSF979GFOsenht38wygt+D5DCR22TXfxtPOdZufCdOZZtvJ/mMJmSeJt/AOuAci/Ml8j@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZeAu4NCbjd6fCCmHShlEogcnYABh8/pf9qdrEWgOwtoDbCM8
	BPbyXIIZM5+BWaviinK9wsPfasQm1tnHVsikkVXab4+SwFvK3BCTO5ulwTRVV8r8vsyOR0/T2Mb
	l6QXX2RC18OAGhr9Sxvy1bjmFpBuqQmo32/L2988S5vLWobBkUh+kTXYS1DlEt2DQxgHz
X-Gm-Gg: AfdE7clnnocldwtu9raZRFjqrZXtRAz2LyCiEgk4JcC6zyMq7Q+8dLUUt868O4ovool
	slW2LiPa3YXdr69vEtwcH55Zc+XheOS6i8eIBmanNjrt8D6E4vL6j0rLOO8Rk5DxJK74yBj4HGZ
	VSB8QD52JCj9QWIAE/UHkjcWlyDNrMdPGU70lrFSIiBKolAZSZFrMWSBzyo9DpjD5oi+3TN++GZ
	qTLscZMauDbKbNSIG7yf+pqiasVIjBW43xM+3IXWgZ6+RPhotBUob0h/h80LFFDRoMl+eXhAbEs
	5yNlzw42Gg0Q62Nr96+vk5gughVG4816OFt31jtJXAYihoFR+TALl4OqKIN7UWRO/WgTm61ral9
	rGjzdx9WCminjzjx5Bi20TYiW/ve96Gr/GTY=
X-Received: by 2002:a05:622a:9c3:10b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51c4bd5a87bmr80136091cf.1.1783411027785;
        Tue, 07 Jul 2026 00:57:07 -0700 (PDT)
X-Received: by 2002:a05:622a:9c3:10b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51c4bd5a87bmr80135851cf.1.1783411027315;
        Tue, 07 Jul 2026 00:57:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82311fsm75880366b.8.2026.07.07.00.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 00:57:06 -0700 (PDT)
Message-ID: <c9fc2770-d436-407e-998b-b7ca49ee344b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 09:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
 <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
 <b11cdc41-e88b-4815-9349-453f1bd5f14c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b11cdc41-e88b-4815-9349-453f1bd5f14c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cb154 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=w5vk1yBYWc5d-UbTd4AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 08dpjdUBQLMp86i9v1vIM5_3UEx8ESv5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NSBTYWx0ZWRfX99d5Eu9SB/My
 /LMv0jAz4VWIhTCVl9sNoFbOWIezS1eX0G+WcGC4DLuQmnAAhu+f6DztEghi/jFHD94+Oic7HMX
 tK63+Bybtr+QL1X1U5UtN/ZwVyosVJk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NSBTYWx0ZWRfX1ztOhzAeamtQ
 0jGo3bHLBMOKFoRTluibj9Mq8ymQPHNGhMkVP+ce7xcTPn84faktkd1EJGHU7wApuO524CEL93R
 DI0zK5TiF1b9RHlTDPk2mOs3ptg35Mc+TxmhcO6ADB1LxpWlmCagth6AJWlk8Honr3/SkeEwhOV
 RAcTrs8hWSSSBPFvH7m8xQOvwE/sByDAy8CM8fUDMipvkzZ9uG1Lwp/EzCRyWoa84L3IbLXaOcS
 A00Dd6yLA2vhhvc5vbE9+tlC7Y27mG4p8le/KtBvPaYTzundvpUaeKci4YIoCRKNeTEJPiQH0b+
 gcdYptcncCzVw+rOY2tAkZ3tw1W/UnIfn7lOaS7JB4VbLwRfxaxiuZAiYY1Xdl7iCU996UWYQUS
 /DCXbTIbdE0ZC4Shhr693mqp+9RPX8kizNVZlAgmWKtMeRBaxfAYjPSlpCV6u3EeZPDoAbd1L2A
 qIAu5zU0ovScVWbpMow==
X-Proofpoint-ORIG-GUID: 08dpjdUBQLMp86i9v1vIM5_3UEx8ESv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-117173-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5BF1718CCD

On 7/6/26 10:06 PM, Akhil P Oommen wrote:
> On 7/6/2026 3:07 PM, Konrad Dybcio wrote:
>> On 7/5/26 10:00 AM, Akhil P Oommen wrote:
>>> Adreno 840 present in Kaanapali SoC is the second generation GPU in
>>> A8x family. It is based on the new slice architecture with 3 slices,
>>> higher GMEM/caches etc.
>>>
>>> There is some re-arrangement in the reglist to properly cover maximum
>>> register region. Other than this, the DT description is mostly similar
>>> to the existing chipsets except the OPP tables.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +			qcom,gmu = <&gmu>;
>>> +			#cooling-cells = <2>;
>>> +
>>> +			nvmem-cells = <&gpu_speed_bin>;
>>> +			nvmem-cell-names = "speed_bin";
>>
>> This looks good to me, but I thought that on a8x, we're supposed to use
>> the freq limiting register in CX_MISC - is either of them preferred?
>> Or are they just hardwired to the same thing by chance
> 
> I believe the other register would work, but I don't have a fused hw to
> test. OTOH, this is what is commercialized.

This is the answer then

Konrad

