Return-Path: <linux-arm-msm+bounces-95713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LEXIRNuqmkPRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 07:02:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D658221BEE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 07:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 948B73016CB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 06:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445BC347FFA;
	Fri,  6 Mar 2026 06:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVp5bHRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnQqiag/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED630B53A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 06:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776933; cv=none; b=QP2xCF3aGpwxBMzjGbOGbpalbqT/QEtW+DRzEVKLXHFcqNFOFo5eMMiJvib9I8FyRYcvzI9FCnCh6SZID+/Oc9P34VBh2098phTWhafGhiV/iL8dEpnvcbgtWqn5e+1KJ7msTReklgqs183e0KOp60yoMWwufWfvr+jmY9sDukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776933; c=relaxed/simple;
	bh=9sk00FhwJlN27t1I+qg5f01mhKYACYC7WoG6IoYXZ24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfRw42fH6cF+sYh7vw5aPZfmP2setfY3oCBD1lI2zzQbnFi7gbWA7Ibma7p0G4wpmKmOcZPiYcIlMrC/qdLXUDNSETEML07q3xmhr3+eqZjOf2lD1OihqfUNr+OSAzTlJ/Q1hYM1GEDjmXiFaWvl5Wz+dRaH613/Pq7iR8QnBg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVp5bHRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnQqiag/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aajk3886706
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 06:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lIdm3m1j/KPISpnH4FOXfsMMLgGhXoDcZpcCWpI/SxU=; b=DVp5bHRHm8wDGhHk
	Oy2O1jtJ4zvcdm7y3kRlm+yP5HAPHMtelRYyYQGj8XCD0uyCXMZ3AVl6IQmn5ERZ
	xYz8CWA6xnYjCWnMy9+LHRQg7mADCmNMCFbQhy3T4CChIvX+xyzUD5CYZEy6c9gu
	Jp0X3yb/XwExsqwFjLcY/n9OEh3IhpziwGyRVGI8fxrznhCRUVUn642lZTG3BSat
	KRPSWQollaniCXETLNfK2MOBwx+/PNkADcQwycPOG042Rk4wHXZvxrjYlHPNaMCu
	cfGOZ50phwPPjbfaXJyzxkBvOnPfzzFZPbFimHL8pFBtve59zmcCbKoFBvr/Kolh
	dTd1yQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4s9b4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:02:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35979a03106so5978578a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 22:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772776931; x=1773381731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIdm3m1j/KPISpnH4FOXfsMMLgGhXoDcZpcCWpI/SxU=;
        b=EnQqiag/CczJC2vIqGsjykA9ie3yZu6d5xV0npjYtvWygxwxAXk+9wewuXIdBzqp7y
         9NxcVeIhOYPr+acFkoqz66iOTiM4iPF4CAZvccqQtvVGYmqH1v/dz/O75yCur6OWtuiT
         srkfBIr3Z7A6RXb+Yd857ayim4+ko06gJPNQRSiIExevSh5/hJnzcgqAAKrZeDQC84PA
         Y4rgoHnm/pkCu901jFaorz3oAEHQoGZIs8wdMCOhAX59WXPmpTUBCO9UuwBrJTVq3TR+
         /yJqAywDFI2jmdHs6B/vhZYNwV3cVM8JzoeMJoI/4P42C/QEWpBlRhDklWtvH7CfqA59
         ol3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772776931; x=1773381731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIdm3m1j/KPISpnH4FOXfsMMLgGhXoDcZpcCWpI/SxU=;
        b=rdUrD4QDKzpSTlJfoVcWCGKTLPHyLO/gsRrbaKWXy5ogs6K+NU3vZIzFfpjWV+hLJN
         DZC+MgUzGDrMH111yi2QNl6aEhy2jHNwn3rH7u3HjaK/4O9ali4i139qSTbk0RhK49HM
         kcOE92YUX4HzzR6EmLThQaubsAmwjy3FzFwJe+dIt7qZ1je1xMNZP1srKmcjRGfW+mBp
         +elWfgaze4oEGxCP8nb6fVcnSYODqK4E6h8R2f3lH3PqIPIps8pvsdoRozeW1aLgQdZ9
         LUN9eJa3vz8Z7gE230PCbiuBRKFXaYe5BGv9a1znrQoske6P7n+l/wXo0nTDKEo+lGf/
         CgKw==
X-Forwarded-Encrypted: i=1; AJvYcCVLgKbv/wy4ZPO68/mZv5wOVE9WkN0dYO6n+bLr9u/bKNUoSkFT1rBny0x08YQqn6RRs85tb84VIDgyx9Dl@vger.kernel.org
X-Gm-Message-State: AOJu0YxRRokJl/5UGwjl9Ol9F8jGacloMbtwWKqCwgw/WisAZxr2zdef
	TUt+hmlLD4MDgI+aRz7vN32t7bmY7Bo02hrGLCqr0qj+1MnqyrGsUaeret95rS7dsUt6VnsFdSk
	Eg2YmLifINq9eUaLzT6etQUDClbQnYRygqPHgSfPdVTW2744o23ladjvK8NHI3o088kch
X-Gm-Gg: ATEYQzxB0GWT/kjytr3z65y+M0bMvFakOiTV+ISdzKWPsK3lmiOZv4McN6YJydrM3JQ
	tXvp+j8JHYZ7Pr1ZyreMKETAEYemdQFKtyM7PB/X9IIbzrgVtiOe4wtFuNXW+vdslQxFRU1z1Zn
	73gl+UR8SKrvUei78qQWO4GHFJJ7urffJkjn2kxyolahJCzoE4ZRSu/sknI+nKvnAXVYzDRKi4A
	Xd1Slu2OKVssU67RnZDsB9+pkZAuvvRlrvY4YTwcW8pobIO2iWLBtJdRJcEaJ7hvMP4QuGQ0GRl
	JIuUTjqKOloHme4zv/U+y3NUL/qM05Ll9lv+7NX54/dJ7SK7B8FC7OIKRA5eX/IPqAP8lJ4RTde
	Aqfl7RgpCMY1ZiwSYngt1QzBbdw2plMz63lIeDEh05jORdZ6wRTHY7Q==
X-Received: by 2002:a17:90b:1d43:b0:340:b912:536 with SMTP id 98e67ed59e1d1-359be347dc9mr834390a91.31.1772776930633;
        Thu, 05 Mar 2026 22:02:10 -0800 (PST)
X-Received: by 2002:a17:90b:1d43:b0:340:b912:536 with SMTP id 98e67ed59e1d1-359be347dc9mr834367a91.31.1772776930149;
        Thu, 05 Mar 2026 22:02:10 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c005e1b2sm759808a91.5.2026.03.05.22.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 22:02:09 -0800 (PST)
Message-ID: <79396696-b5a8-c0f4-7e9e-7a947ef4de15@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 11:32:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 03/11] media: qcom: iris: handle HFI params directly
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-3-acf036a3c84c@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-3-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA1NSBTYWx0ZWRfXzQ2dBKWpRTso
 hFHVYXCp/Dpfkm6KwkeshPm0CBtDJyjOrNC/JSRvRRqJ0MhGkrOivn6Xh9bivle2CaICZA4kAYH
 FoJ9NgY9ZSWYswM2SCfJv4XAXEsmkTpnlnqfurreyntLKNZbUkLcDEzw3MjuiTVO7bTTnNKP68G
 qCteqdeFw3d5z6NTnqthODm/cQ7n11vGULIQlODA5l5loeV4QpPeVrIf5ONZHn5OYF720/kkwXi
 wXqBL2fnsluXASA7nAxcgOSUFHlak8GPj0IAS1Zt/dLcLDsFRw6o+Nexh11ELJr7sGk5RnZg/Gl
 oHlPT014BSkuSGQ/d7iUc1jxSAhSUM3DRagx99W9faiHW+UAqf5wFULXH7jhlv+8hnyx+zV8duu
 MTtV4B6FfPX2rpFyvWbbZH6RhteYO4Jr6iIcW5ri3YSQSaTPEkZqSJcufNiYwy2bEsGjBKDLtbZ
 D0Juzs6+/GKnIFrg7Ng==
X-Proofpoint-ORIG-GUID: lrD3pYhp0aV7MpUbdKmY_hK50bPZic74
X-Proofpoint-GUID: lrD3pYhp0aV7MpUbdKmY_hK50bPZic74
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aa6de3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IrIcjQS8YOhLhDNCWt0oYA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kX4lhrPyMP4CimkWqzEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060055
X-Rspamd-Queue-Id: D658221BEE0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95713-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> The HFI params are set per the HFI generation, they don't change between
> different platforms with the same HFI interface. Instead of copy-pasting

That's not entirely true, as the params can change for different platforms
for same HFI generation eg: HFI_PROP_LUMA_CHROMA_BIT_DEPTH won't be
supported on AR50LT even though its HFI GEN2.

Thanks,
Dikshita

> the same params between platform data over and over again, move them to
> the corresponding HFI generation source file and drop them from the HFI
> platform data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

