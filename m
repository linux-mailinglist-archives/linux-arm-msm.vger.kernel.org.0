Return-Path: <linux-arm-msm+bounces-105978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJPxAKb2+WliFgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:54:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BAE4CEE8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33FBB302773A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 13:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FAF47ECE8;
	Tue,  5 May 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwIBM+5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQkYYwV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F8047ECD1
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989194; cv=none; b=HwNH9Rx3NEQXso0edMKMM0Q5dKWl3eeOrR7zxjOqXOlicsOF3NOkgHheRO03Ac29OQnnN2sJeFPareUpzcPmSmiYVQIXd47/o2zmADOXEkHTuD95ludOoVc0CF6604TsU5FGBo+GGJ8nHbkiOnEUdphx0/WjE4fE4ZPn8w/dk8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989194; c=relaxed/simple;
	bh=TNhWjzdEghFHJNAFmjOMhfHZQ8f2WLJBYXhEETPqwrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKufKQD40lAN9oM8VapcouEmGZ77/MjwWMMTC99XmAAyZtLDVwV0i4mkOCzW0wFU8OtsdN10peEdJjl9BH3zDkA3EAoRCXsjS+X2SvBPvkQeQtJSE/0lOQ+Uq05DHWPcaYgiU5Ng/8V9w61qKKEeuYxxIqg7gMgiW0Von8y8Css=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwIBM+5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQkYYwV4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645A4OXh3741190
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 13:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytR2on/u6KptxUeENDxG4kfoJZLPo0FnB1HrFH3+m8A=; b=YwIBM+5kVjS3yA3K
	M0kE87hEd5NrtTvr0wlV2AFAAp/4W5TmE9d4XDwpKV8WAZOxVMhkvku1Ge+4FqwE
	iAhCG/AcFpM/65IEdsf3aO4cI70GRRI/nSsCPBNjRsoMleB1caCaiyhxv0UdbOxG
	fm+fG0kvu2b/tyD1oi1uLY71No/zBqjuTwvroCwaPyQmWgx7Zhr3Iu0MEVLqY4hw
	tjbMEGfS1gW2G+UhWALeqqFpzwDTo4ChgGgq4BDXn30pvECcCp3NrBLMEJQwPBYI
	lWN4Fy3BJepkWiSYxsXKoLo3RcM97SkNgiHDI0PY82skUy/0bP8aNobZmETTM3ED
	6BtLmQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyefq8vwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 13:53:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82717caafccso890777b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 06:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777989191; x=1778593991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytR2on/u6KptxUeENDxG4kfoJZLPo0FnB1HrFH3+m8A=;
        b=BQkYYwV4zARZRcmrqyw9ty1sgAGlg1PPyZqf3mTPUxm6SyId9I3nwf8ZfDz5In1uem
         3yNBv7/XZZIveFBdzqC72+NMMGqvhSlSwf+sWnn2rmM3eb2qL4ifHlHVypj8g2/tDO+c
         T3CJX2NWi1Pt1Mn/FUXNywrYDw7qw67uXhBApLETFvSiv7w5klKzRM5ASX3ed9iWY5Q2
         hPw+Dfm6qYOce6d+fKaBvCpHE75Glm+wdEg5PDVhdWwIV8ICNNsU4rUysjwoW1Df7Xdy
         EtRZjglZGOlONJds0lQYUcUXR6Pfat2jUa27lb1eLrVL2/lgJJ8R2INIAUVcvcqcOKdU
         cXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989191; x=1778593991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytR2on/u6KptxUeENDxG4kfoJZLPo0FnB1HrFH3+m8A=;
        b=L47hryPcuUgY1lyW9N8SfOOK2qyMKjapv+DPr3O6q098gNbeLuJEVBG6OY3bkYYgnQ
         2gzAFVVRxhH5SZAVj5LLq4RNfcxbC3FJvlr7eD5lfqFMrdSPGYMQSrQARxGSUYqnaGVg
         c3tO1+ZxD6Eg7TJpdkz/BkRGDTc3BE+Pkq2C/Bu+Gc6Kckh9cS7ehunLEQ4gj+3NLEdR
         1FEfUB1hoXnQcMgsmksb0fzrZIs0mt2p+yLvoeL5SlaDFlSYvfe4tH7RmfijaCdqzUjT
         dgNkmkMOU0WiAimOrSaR48SCIYkFjte6nVFPFv/i1KFN3fXW1L93QLIVOWUUViGOmMsn
         m5jA==
X-Gm-Message-State: AOJu0YznYz59sSihZvfDFHRu+hdSOnb3ACrOjLLOc+39Ywvbl6DvRMDN
	MYtEvY06+uaEWdyrBGQNHENvEq2h7FsmGebfKCvuKYrI+kmZ1zjctYdmOAOeA5BmYxlIC+lGy9y
	vfdAi0/2BnF3EBxeVkM/RHccAib+80rC1WZYByLCb4eoO9oawxTjEAuYsOFkvVavhUI7S
X-Gm-Gg: AeBDieuXsO6XSl/X0Yst0xHcTDYL1tx68fdpctpczSKt+WVSPrmZerqNZSfVsZ6mwUh
	cx+hSDMRR6ABvr8eK13mMjLfWvpIJXWrrXesAAjTFQBYGoREKw8zP5if5L/xXwFpLKEXvlIf8eB
	3g1NBBBczXb3uTxBPaoB2bBHjigZDxX23f27b38Yf2JfB8DZQCD0SsQ9Ivb7GnijRVEZux5/Fr3
	QUCVhSLJJ8UTYjRDXe8t6cLFU+hK+vl3d2ZyiHjLmlFacwtSBD4vtkjib8G5IjkB380bveu4UXk
	C1hpTHuDLODKWudexbNQXc63xo/7vP/lsYK655JysIr7k6PSDTkprrX5uNDeAibFDBerwCr72Lc
	peiAK58ZR/NbmJzPG0VmX4hhqwI3LfoGINO8dfEDoZpyCbMRjna1eA8an7yZ7
X-Received: by 2002:a05:6a00:760d:b0:835:36f2:7332 with SMTP id d2e1a72fcca58-83536f27ff9mr4928776b3a.2.1777989190688;
        Tue, 05 May 2026 06:53:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:760d:b0:835:36f2:7332 with SMTP id d2e1a72fcca58-83536f27ff9mr4928753b3a.2.1777989190057;
        Tue, 05 May 2026 06:53:10 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.27.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a4bffsm2164299b3a.56.2026.05.05.06.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:53:09 -0700 (PDT)
Message-ID: <f759f97f-1231-48bf-8d2f-6c13ccc841e8@oss.qualcomm.com>
Date: Tue, 5 May 2026 19:23:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
 <4a41079d-4e3a-438c-9996-c756206c0c3a@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <4a41079d-4e3a-438c-9996-c756206c0c3a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzMiBTYWx0ZWRfX5ChjS/lTQGLw
 ESG6Gp9xaT8ob6kVPFqzAkxy4fFLpeHIlCOjXRB6Fh/z4E8BFXupbR87+yCiE+nq0xf5WvW/xN2
 1R0zc9XfEZl9bUOLx4z/+AbagbdL572SVNRwul3O83tCdyXqBBx5MpJy8GGZ3h/zuhDVmyig1lH
 laWG/RY7Xh9QWFTIbuTF108gVx29wmdgacNteqEFtHphfB1CbnUSSchVPZCi0aaPt2aTLCWFAVv
 nKMT/Ta7+gcyiSQBJHNA/l2CLRnd0tJrX8EVL48ro1XXb26B6wNgI+UMY3Nuh1HNQhIK3UF3kwl
 ZEjcBqmsb9/nx2zpD1VSilOCR6h6xXtj8WkmF5F6lcjRscnTlbChIyKmXXp614SjduydGHUPbCk
 rpH1Uv6ZChmt70FXntlRDJgzlXqcFzZZ8/Zbx84YMm2YRrH9Hi7GazrNfmTN11tNn7FPA4Cu/l3
 RwOsrsCsZO362YWjqdQ==
X-Proofpoint-ORIG-GUID: yl7b_8C8lKzlhdLvRLXoXep5w7X3soQ2
X-Proofpoint-GUID: yl7b_8C8lKzlhdLvRLXoXep5w7X3soQ2
X-Authority-Analysis: v=2.4 cv=edoNubEH c=1 sm=1 tr=0 ts=69f9f647 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=9uzW0PS53YT52NB8YZ7Mfg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7p7hMAAamFtOh5F3elAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050132
X-Rspamd-Queue-Id: 72BAE4CEE8F
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
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-105978-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Hello Krzysztof,

On 5/5/2026 1:49 AM, Krzysztof Kozlowski wrote:
> On 04/05/2026 14:57, Konrad Dybcio wrote:
>> On 4/27/26 7:05 PM, Umang Chheda wrote:
>>> The monaco-ac EVK is a new board variant which shares the majority of
>>> its hardware description with the existing monaco-evk board.
>>>
>>> In preparation for adding this variant, extract the common hardware
>>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>>> include file, and update monaco-evk.dts to include it and keep only
>>> board-specific overrides.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>> ---
>>
>> The patch is a bit difficult to view as-is, but the gist of it is that
>> the resulting monaco-evk.dts is:
> 
> Diff should be fixed and since this is not even b4, than producing
> proper patch detecting rename is trivial. :/

I acknowledge it's hard to review the patch this way.

I’ll rework the patch to use a proper rename (git mv) and keep the
follow-up changes minimal, so the diff cleanly shows the extraction into
monaco-evk-common.dtsi.


> 
> Best regards,
> Krzysztof

Thanks,
Umang


