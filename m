Return-Path: <linux-arm-msm+bounces-106089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAAyOHUH+2mbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:18:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 596594D87C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC47E300C802
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1853E275C;
	Wed,  6 May 2026 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPwQiFql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OaR+n63t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4975F3DE455
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059122; cv=none; b=hKT6VfqYLOG06+A6TRuOPDUjRvEO9WPKQu5Vb6nxzUjgRC9a7ijRAy1w0XDyyVy77oP2kdvz7hfGa6WzmIgGHlZMl2WgvjJq+CLtjyTC4OIoP+496LhYdN35Bk3OMN+rm3zZ8+/ztsYOuDQVOUeFV6CgPySPxvjPwiYZpIzM9U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059122; c=relaxed/simple;
	bh=xXhpM+uwgKbQ8hANUPCTjKLpHngvDWYDJI4oV8CRQX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWhx4XmFdquniYbtGj3atejSBufLl9wG7Zg+fW/lRMfJwrE2+aAAHOkMwHYIIH88oWbs/vWoD+66VuVeEwSTHcVVJtyrwTq2kSzVVRuoIhWFIqAue+D7K4pdyEkjk29j99LogbXtsRfsNPqzmn5sAiG5VA6ofovCEXvJcRGgD2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPwQiFql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaR+n63t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466W0hg911975
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 09:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPy4HMvP/fkoxz+Ied32gFDs3rh7j//T6g8oHDAcI5Y=; b=GPwQiFql3ME9kips
	M22JsxqetRptCLvYbq9FMKn+ftcp0c9umZqEGz004mAmEGV0FvGWpcDvlgSRo6r6
	MZoUVan9+1zqH9MIzOXb2OGAUZCeJFgix0IPM8z0aanKo3RIERGIbO768XExhy8X
	5sv0jtyooZB2moJQrQ73AX/JBqXzqQ8X9kJumLmWGirL04CRAtHYKbIRq5gnV0K/
	XCKL82NVupQmtRsEP4Vvj6ufHw/BL6I1rlyFPMjs80TAU/kghjJC0FX3PZQxovud
	PgNJAhN9BKiH57taLvbaYtSewToBQHPOb/cCcBJNi0sE4FtFI5nmPYvSZHSA1/L6
	U6v1HQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jm05v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:18:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso67443021cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778059120; x=1778663920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPy4HMvP/fkoxz+Ied32gFDs3rh7j//T6g8oHDAcI5Y=;
        b=OaR+n63td9LdvJ68GpE6aJc9MA9Yq6/TeP3tocLOM4HmBSaOpW4/0ftC5nl1dDtb7V
         oUa7AGgvgc5oOxHoOxXE/t/doEDWWu0IZH1K7hQQwbt7c3bSm0E/w6/dDc7crsK0zaOT
         euz00B6PerNYWxd/qJX9a27kJAu4Q69pIci0ewakXUD8gXRNe0uomGocLvQLPEXDy65N
         sKPAGgZSm0Yh4Q00PHi+LhR2NK5JS7/hi1oSg/3/PxXsLQ6AZaYk6W5FBjSJvtzr33dH
         jQB1Slslma4yE/vwkzymHN8hezEFKPBJ4vnXVsgqPVKOPX1WxzzxhZ8VqljvC7WddM78
         CpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059120; x=1778663920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPy4HMvP/fkoxz+Ied32gFDs3rh7j//T6g8oHDAcI5Y=;
        b=BgXbEIKsTWBXM9dtYcHc1+lA9sprftboby5RGXGYuA1WyedB+gQ1Ks81GVauPp/yM4
         cxuX7yEs6PUliRag72mRNEqmNonhmQvanXkfyumBJtncnenUzBZKBodDAm5WLDSQPHAZ
         uBTH30GAOi4gP+54oRK3WNwinpSi33hp3QA/wU42PrRDgEqrxpy/anYNIz2X5vfAkqQA
         w4OtjSEZKbA7gqqd/Oq0i9GvUd8hD4hxQd5xtmv1OyxaSUZKnuh9qK4HWDJGymzIPLBK
         lZ4+LfZkpljiEEjjSZuuX/ITusNWuIFaPd3nPkGnb03FbDIJL6b8QULkiPtTlYH4WIIt
         qANg==
X-Gm-Message-State: AOJu0YzOt1mgfYD7PUA1CXv3vi44h7EADwgKRQlLojH4JJ2P1G00Waw6
	g7iCSmfQMI0v8ufjz8quAdZfkq0VV4dYA8O+rquPwWCO6VB78rJyQPpPaBSvYmbTeFjGktPNR0U
	gm17fXZWHIj4vkYmu7Gi0xhv9RWbYoRQpnZtkl51NBASSmOND5MaCD9ISoqQ6TPhNJ3G+
X-Gm-Gg: AeBDievnQF9zv/YeCho3N9tOObDbrh3W4gETYKprNo0IjMuER5a9kehyixs7gad876A
	7RDekNdY6DS2ZOAC5TnC/DJMAZ5KXDuJig+YE5sY9RNLQWLQKNzBQ3eJYAU6/Aq+EbkmwX5RNXn
	YbzoohBCT0TMxSRimL32wvx5qt5RRuhScaEIWrEgZV9qYlewIsC0yYtWb86q5IWaOPwJ4OS9aP1
	qnHRmQsg87X7A4yjAd6dxMrcr3E/WOV67niHCfOUZ0vFT4dOihgnnFBJtYym4KuT+qeGrOC6e84
	a8lmWnc5IQbDN6pIuXVfdeNmgkJIcmW9nYQvCR8KY0bHVYd5+6DthADzNRANlm9yFnz1138ga3h
	FRZo2QD9CcP5zjCz+1scHOiTZPXYiOqNVZLOd1DnbVVaz55C99olMbgth3LQ1eC7UavNwFeTxok
	mRqSxBWg0lNP/tOQ==
X-Received: by 2002:a05:622a:6094:b0:50f:e5a1:29c4 with SMTP id d75a77b69052e-51462884edamr21764681cf.4.1778059119791;
        Wed, 06 May 2026 02:18:39 -0700 (PDT)
X-Received: by 2002:a05:622a:6094:b0:50f:e5a1:29c4 with SMTP id d75a77b69052e-51462884edamr21764411cf.4.1778059119116;
        Wed, 06 May 2026 02:18:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91a4716sm1078509a12.16.2026.05.06.02.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:18:38 -0700 (PDT)
Message-ID: <e7c9b78f-f6ce-4f17-88e1-ee8e6620fef6@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:18:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
 <4a41079d-4e3a-438c-9996-c756206c0c3a@kernel.org>
 <f759f97f-1231-48bf-8d2f-6c13ccc841e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f759f97f-1231-48bf-8d2f-6c13ccc841e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MCBTYWx0ZWRfXyNzLI7Xued/x
 c4xCegbwHZcG3dqqWchsUkQBmk8JljrvpgEP4M5V4v3rMnZa1zBlM+CmHPs8FWuEoeCYGdb0DfL
 3SlbKIEWD+m5E82H1f3UMImvw8nx0LtvTGXqv55eQt9M7iA+BFuSKomE2xMK+83aA83YeEFce71
 AUN+JXeWxL8V/BxNTea1afA/AbT2MT6trL7HFx6Er0/mlJgEjOVLmZcfjVKmLNcPhkecstfGWDQ
 QixrsZdnJUCO6U52+O7SoT1WBxSgzebDtayRuPs5p4HBgPQ3skkb0EiNtBVT9zPTUkfcnz075Mm
 wK67+rI7BrEhtAYJ0ie7YW/JREjxJLEGOO8fGb9VnJfrINBN1r801zX0lqUh3Tgbz61v6fq6XGN
 VwYchtiAhDdWxSNIA/30FQHV4MsyIYCdNJxFVvdSYD7trQVwpucjUXtBi/dxPIB5XMSvxIsKtIa
 hJQPWrjUtBQ/kcxyjUQ==
X-Proofpoint-GUID: lE9VwiI1gSRPTBj5NI_3aMNOxeDsULjm
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69fb0770 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=or55UZEs4ujotfME51oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: lE9VwiI1gSRPTBj5NI_3aMNOxeDsULjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060090
X-Rspamd-Queue-Id: 596594D87C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-106089-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/26 3:53 PM, Umang Chheda wrote:
> Hello Krzysztof,
> 
> On 5/5/2026 1:49 AM, Krzysztof Kozlowski wrote:
>> On 04/05/2026 14:57, Konrad Dybcio wrote:
>>> On 4/27/26 7:05 PM, Umang Chheda wrote:
>>>> The monaco-ac EVK is a new board variant which shares the majority of
>>>> its hardware description with the existing monaco-evk board.
>>>>
>>>> In preparation for adding this variant, extract the common hardware
>>>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>>>> include file, and update monaco-evk.dts to include it and keep only
>>>> board-specific overrides.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>> ---
>>>
>>> The patch is a bit difficult to view as-is, but the gist of it is that
>>> the resulting monaco-evk.dts is:
>>
>> Diff should be fixed and since this is not even b4, than producing
>> proper patch detecting rename is trivial. :/
> 
> I acknowledge it's hard to review the patch this way.
> 
> I’ll rework the patch to use a proper rename (git mv) and keep the
> follow-up changes minimal, so the diff cleanly shows the extraction into
> monaco-evk-common.dtsi.

Try adding this hunk to your gitconfig:

[diff]
        renameLimit = 999999
        algorithm = histogram # or patience
        renames = copies


Konrad

