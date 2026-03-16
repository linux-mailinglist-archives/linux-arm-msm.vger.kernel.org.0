Return-Path: <linux-arm-msm+bounces-97951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABiQEa38t2mXXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:50:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DFB299AAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0448301840E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29C739656D;
	Mon, 16 Mar 2026 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmOHJHkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTM2iN05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1E29C339
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665450; cv=none; b=onFu5u5tRugwgK4z/1RO8hgII8F16dluWG3aoQVu+w/NBLZTX4mjgDhNMEAY+FOFwaxZgpoQtq+L0pz/0ClHmIi4RBxynUHTUkytu5u5GltF3IzVhUut16HGSNQ11SlUPxtrk7XtFYvRtgXxo0youZOI9Fj1mQ9iu7RKekJ65ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665450; c=relaxed/simple;
	bh=q4TM2LlV744b3L/EatHrhl2+N3BL+B0D8u0nAFHbvnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1OhCfPi6Mj4gC/yxhJpabVD6VpsWqRkewm6JUdwWJ3W3MB2YapNXoXdG5A0nJMB0VpZv+sYAUhr9lqrO+329Yt10d1dgEwIwDqiEk4QhXpS2QxHijVvIMvriCtC4khw0hD/R7vKgPaSrBDxLsyCppZsHRdhTSvnaQGt/snuwbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmOHJHkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTM2iN05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GA46bd3124536
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EUoaoPLDpNNWBVk0FzY1tCyE6j9Wdf3bW45GK+7R3Sk=; b=dmOHJHkpvjGuOt0p
	Mn+S4MFRJD728igNpk5vwpHk3sL/CKJFy3HpOvq5wEMuL9tGAyeEQUrYYaFJmL/w
	Yzf/KzaKS7DagCGnJazuomQhcgKptv9eWmrfWdvBiqTjjV7gZYqQ6SXUU+B4sbO8
	XbI7oMDZwQH3ZKdnWVW83c1nmbXg7UaWdXxfHWDryfiSkzs487McV1mXyLm2EFSy
	LsVm/wXzyuFDiDiqwSkp2qVx93RLtmft5jBSLmkZSFTBGZPEa4s8sPFzGqMK+/Cn
	cGRgV4uwWkPfWeky3zurdhl2OU79sA/JLql7Jvt4BQH2fToKrj6+MpZ0kdO3TiJw
	vFgzlg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmgj73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:50:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8ea43d4eso222500085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773665447; x=1774270247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EUoaoPLDpNNWBVk0FzY1tCyE6j9Wdf3bW45GK+7R3Sk=;
        b=YTM2iN05WbgGscYinMZW+QSeiNk8ZTlorMoeZ/ojRyefFbqRRVMZoluev2bsi0OtWZ
         FYrOIP1u9D/UD56hlUN8bRUkGCsDnuNHFz/Lp/iPlvhA8rGVMlY6mCWQBav2/9FOyNJK
         ZywWwK4FiW7Ep+TYjG07f57TEG6ynPBgl6iEwGl39PhzXFPPlA9kd/60fbqfSVgGfz/B
         rHvGf7ABxQ2wquZO+JZQhkKFUtK7FoviwHqMpDw6naEFlurMnw8dykumQhQiAH1anpiM
         VCgT/RxxEv80eDDQp+z4NGiAt0iFyBaQKM+wrWjh5V8VxNQlYSiguVHaOEnfSw8KR+q6
         ZDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773665447; x=1774270247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUoaoPLDpNNWBVk0FzY1tCyE6j9Wdf3bW45GK+7R3Sk=;
        b=rwV4BrsdSr9KNxdyyJ5cL6cuAug4zVmPVWUB7coBMjyRLSOOPMi6gZdLKu+s2Iwr4+
         BBifSPgQFCN1zRE7caDefz56IItehcINaJ8t8gmLXlvm2I6HaHIlnvYTZI4tZ3zEuSJC
         5zD2hONZ/dcghMr+AePDDr94optlePDqj/UPhbSg7U+CeyvbnZRlW+B9vy147+VXexq6
         H1Sr58/XdApUNdVbrX3yMXInK1Lc31zfP30MQ5Gimy4cO0U+x3ZOxJDmLIFF2qf1cJfd
         N5rbs0gM0rJiu/sTFRe63Wtk90sR9JcXH5rCT3L6dq6fWeJQgDuVsIXJS15MCZlBmMaj
         RMiw==
X-Forwarded-Encrypted: i=1; AJvYcCUoRrnjfmeKsVeq1tARWTX6lJpeWw/Jy0/EOzCJjfsVsj+bqXD9FBIOr1jN9oHszWvfGddrTKW6T5lFFg8M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ZL6NnLlaab3e5Un4df+yq8QvOOls0fXfYuY7RQjsoMoRkRjw
	JjyEEz3BpwQx+fGXz+sQsK9h79mRaeQuJIUgTwUDlPf9eqk1I8Rf4L8cRzUuKfewqaN08xus30M
	XJ/kf62UQGU5ZKFV+T0GPQwJAoQRFssKmdz9VvNSVpTzPykvtATXJ7t2WoXapEHnyKzdY
X-Gm-Gg: ATEYQzz3pgkTQIA//9b9Fjvz4qG76xnQVBL1OZ+2Bt+c8ETmfG1WXGYAXBaiJnkvswx
	m6mK8sItgvHo4vWaW5HFCcJVKBgakQKOchtm8buj/Zaia7goGm5SPhXgmGwtllyh+6cxwBZLkVs
	k/X5yv93Q8TutO4QKn8mQ0a65qYZHbvFkuqkyXoD9IT2Agruv3MDrMF4tMzf2FHB81tZ6Gq1oBy
	Qe/CwKPO9+vLqtkrWIQbT5g6s3YGtOgFTO+9XnhXLNC5XWAbBYWfd9p+PmiZ9/EOiliZOJQ9SSD
	x77vaKaEXT/7rFncUKZZRjmcHPlKkqq4B8s2R2Y2dcm0FwJb09adbdA7/J69F/ZMy61o1mVXpyg
	gtoOvLHsLl7x+FauFOzB8ShAAQff6RSnrE3h1Q8yuOkqosM0UDJuC+ZUjInYzI2hfxVFqJsCKe8
	SfA2Y=
X-Received: by 2002:a05:620a:2948:b0:8cd:8ee7:4473 with SMTP id af79cd13be357-8cdb5a83e13mr1254055385a.4.1773665447286;
        Mon, 16 Mar 2026 05:50:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:8cd:8ee7:4473 with SMTP id af79cd13be357-8cdb5a83e13mr1254052885a.4.1773665446900;
        Mon, 16 Mar 2026 05:50:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6650f44a4a2sm1924768a12.15.2026.03.16.05.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:50:45 -0700 (PDT)
Message-ID: <71f2b29f-a34d-4300-ac9f-ef33694e1f90@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:50:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
 <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>
 <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>
 <DH1PJFGWESQU.1OEKLN0CX3IZE@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DH1PJFGWESQU.1OEKLN0CX3IZE@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5NiBTYWx0ZWRfX9is3XkkSwDnR
 XvRoogBwTONALE4M++ydwRxc0faqiqVi+BUFMcYmmDkID1Newy1qCkcHYAdl0JTdxDGxzVfwneX
 gQbg6TGShb8d6mAfshlUxc0h+6aw26RrAC/yH1CRC99vRoM361lYrGTw9sfZTZoUqE0uW7o8m3M
 aFwK/irSEUL+O/DkbLlXD+8xOb3VK/7LUcAPeZtvOQ0bin6kPDhgboudhb5aHL1UkHjUPQhD0bM
 phs7PBe7elw6fC7rsIYhYV/SduyOFcpTmNRIUzMdallDW8ywhms1qmJ0i4VMSPhAN3w3v54Ttvf
 j9AhoxiJg79TWvi1Q+qZpf7n5I4N2WDq6a+5crDAklsG3FGw3tCSTyKyxQ5Ph+/ymrEtDW8VypM
 3oB4OCGQPasRErahB43WFdY75wimGD6Z7PqaxsidCWrn5cS8RBig3vWFDfvXQne3V6fn1QPmY1D
 YBAf+wgMxJO0VFowKbg==
X-Proofpoint-GUID: nLRGvWFGujt0pbg8DOgFVmi6Bvg_-rvp
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b7fca8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=UjuIjBpub3zfU3wH7hQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: nLRGvWFGujt0pbg8DOgFVmi6Bvg_-rvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97951-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5DFB299AAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 3:00 PM, Luca Weiss wrote:
> On Fri Mar 13, 2026 at 11:40 AM CET, Luca Weiss wrote:
>> On Wed Jan 21, 2026 at 12:52 PM CET, Konrad Dybcio wrote:
>>> On 1/16/26 3:50 PM, Luca Weiss wrote:
>>>> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
>>>> parts.
>>>>
>>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>>> 'clocks' to the PMU node to make Bluetooth work.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>>>>  1 file changed, 174 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> index 52895dd9e4fa..cbe1507b0aaa 100644
>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> 
> <snip>
> 
>>>> +	bluetooth_enable_default: bluetooth-enable-default-state {
>>>> +		pins = "gpio53";
>>>> +		function = "gpio";
>>>> +		output-low;
>>>> +		bias-disable;
>>>> +	};
>>>
>>> Not sure if we need to drive that pin.. perhaps a pull-down would
>>> suffice?
>>
>> I'll give it a shot, this pinctrl is coming from downstream but perhaps
>> the downstream btpower.c driver is differing in behavior to the upstream
>> PMU driver.
> 
> Seems to work, but honestly I'm not sure what the actual effects of this
> change are?

output-low actually actively drives the pin low, while bias-pull-down
connects it to an internal pull-down circuit, which is weaker, but also
saves power (because the pin isn't actually driven)

Konrad

