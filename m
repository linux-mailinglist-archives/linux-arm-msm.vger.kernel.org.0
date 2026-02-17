Return-Path: <linux-arm-msm+bounces-93187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CcLNydvlGk0DwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:37:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B4414CAB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22E4C3000E1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F78035893;
	Tue, 17 Feb 2026 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUUwESn5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMSGiaK7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE32286425
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335461; cv=none; b=S1BmaxDZLBYq7xz7ES1j+XmWObaaX1EtRBJXFMs1Z9apVNUo8vxE6yc0MnfEkaV1UrBbrnbby1gW7DD68kCpoJohj3DqSAfGTUouFA4fEMUdiVHOMXfdqcwIs/jFcdoraugdfhjLbkfU8b7zsP1Jn3geDAUoIWaxkhYX2S1yK0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335461; c=relaxed/simple;
	bh=kwV34sp4gxLwO7R53WUnUi6IMKm7Hs6C8QfgbYsm+BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpQIuWD9YiXe0vkAbugUjBnE4qhqlJD9F+MgoGfihV1MiWK+dX3alM/dMLEIBYb8gE7rwsdm9HbNP8R229D5oo7s1R3jILP50YAtjlakuYxRp/cjQ0yo/LoxFqJH4Vc1hTaUt8HZKh0AqNCo3kOxSPqT7CeCMrKrmBBo2K4hGFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUUwESn5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMSGiaK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBvGTD1067216
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+SEogjhgZH3z9z4RBK7IBf59YPxzSZpKQYSCFZg3/c=; b=kUUwESn554XwJijF
	I+YJVZXlawtdS3tN3OUfgBlGfR9orsplxTqelOZj0VCnXNtoQaHou5zyPa6r9o56
	g0VV/5dZUHuV2Xp6pWNZAp8+XgtLh8GmvJSXIhiqGDv89VVUYHEsnxfPDkolOQr6
	BmCav23d6Wmo6UAsXGj1eA+i3DbTJWK/iBzY6DWZbhPNiG0+QjdTlIx/+7MJoEAE
	iFInq7tvb3d5OXxI8WvbBj75UzhPt6TaVGEKSAou6NgPXayIAbj4EXncf/koxBiP
	zn1mMAkFE6ukPC89Nioj0lyWanWtk5ggW67AivDZ6YPPzRWNjI5oFg+FwOevZvnM
	9/J13A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d82f7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:05:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3ef536ddso3293903285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333533; x=1771938333; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7+SEogjhgZH3z9z4RBK7IBf59YPxzSZpKQYSCFZg3/c=;
        b=AMSGiaK7PJHv48/z1+wGcwjPWy4ShfCyVJ+ZHkU28a8iqFXvvuqeYHNJhp/Ezq24R8
         452ghz2tzuwWL8Uza8/ONLgGynHJGDxyYrVHYKVSZAZmKUOFC4bCfAHVJc/USUD6hj9L
         cMdL0ct0+iXYaKqLGLGyh+z0xAhKcgepj4s/E/uRBWp6S3Ja9u7AKRTMrKcSKkYP/eSN
         TQIWs1EpW1oyjK4OiOiNmMc9mHRgQq1tz6MUzrM4HtqaLf46rg4sLw1Fg5rJ+HAGkvZ5
         SiEYdk8zFHSxb5q/4n0bE0rpXh0JiY5dZGkjBV1VEiNG59CMSQOWK47u73RKNHAlHLYt
         5bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333533; x=1771938333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+SEogjhgZH3z9z4RBK7IBf59YPxzSZpKQYSCFZg3/c=;
        b=ArMaC3JPXCR2MtboFOD4hhRh8wbvzWuvPPV7JSqx7BeKlsOdTLuPk/S2l5/N9fokh/
         YxkC011uU3aDrE8AAJhCJwzEW7bn2YKHxs7M0H2fYO1HSnwM/DqT1qJS56SzjGJLSst2
         LYjp+izzFE7zqbAPIVAM1hkhvqfUJdE3pP+eRpN54ok/PmIjQM7AvPvpm6SEFrIjcUQZ
         OZFL8x4wzt0tPSqBVdcyIb2ocI/VG1b9wq+SvJbF8GuFAwM15reswKJVYw/fmPryOyq2
         TkpVN7z8EtwquS13rJZx9PFxyMjx0nPZvCmmjo9LBJz728pDUjoGvXXfz0cUsBGZoiOx
         oJYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQcI998XOV4xQh6sRxtylpCQiBWYOR1aHEP6rDB0oaolVDGckEcRvrKRvZx5qaUJDtM7H37XzQf2lw8gOa@vger.kernel.org
X-Gm-Message-State: AOJu0YxbkLlSIu2EASY1pFw5i5VrlABw8C3MEk0iLDiIwoDhxZrEd2fM
	u47ZTVOCziMge4cu/cRPDDnBEa/I8vziIZWhwE7MgroVV8eM14Kb6mecR05zRGkZRnyOWHVMCAs
	4FlNYpa3mje/3LatyPnaoC8/Lh0LjivXrtEXc4V7n0SzibwfZsBx8WdZP2wX9Kjts99ur
X-Gm-Gg: AZuq6aKokprlLSwxRYnHi3ykvl/9sd0IYwO1qkxbhpNae07DG4RRcnP9Ba4K9rB6exr
	UWcEJ8vnuZui/2KasD/RqMJbPmTB0ZuPAIvohuQiMetsfXwR349S+vxJpWW9S3O3E6cfeONzfZS
	0M0PH1vOyx6kIMt4fm6SK3cv+NpI+BRFSZqJdSy0EGNrGXUSgAzXRNgHgFswv2v8eCaqeOwsppD
	QSSKcSsLr0so3Z0EOSgIljrtZKrSfW6uYkft+PWOQ2CGXGaqCPBwY8Nx8v0uH7LgJa6kEMCts3d
	4x6SE1trO1dfEvJ55Qb6jcuVgCfMHX2oYa5xZR/OWXwSJIyOcyRnMd1QxEo/s6Xlajc39zTetIs
	Q+ksLYbxmK0pEWvWRFqOlc+c0tS+9x0I3CaC33vez6Rcx8ZcQdw6OnLcUow0M3j8jE7sR7mfRNk
	z7V1mAbTnMOSg6KAu0TUJSpOTGYksHX4JrkNM=
X-Received: by 2002:a05:620a:454b:b0:8b2:e069:690a with SMTP id af79cd13be357-8cb4248a27cmr1884839085a.68.1771333533103;
        Tue, 17 Feb 2026 05:05:33 -0800 (PST)
X-Received: by 2002:a05:620a:454b:b0:8b2:e069:690a with SMTP id af79cd13be357-8cb4248a27cmr1884832685a.68.1771333532598;
        Tue, 17 Feb 2026 05:05:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5a07sm38131921fa.28.2026.02.17.05.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:05:31 -0800 (PST)
Date: Tue, 17 Feb 2026 15:05:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Message-ID: <fjklyq2basty7smvvjmh3eyp5lf7gtprtm45w47s5r3abvcbco@usk6oyguwkv4>
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=6994679e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=N8z6d-Pn7CxZ1ZIEyzkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX60s29gXR0Hvr
 fixHXMeqJULMGmIc5qAv2SwuLgnb+nRIIdb507DCwATNFG+8uP7mvOCuBJSYTe1XIDWHJeHVfA/
 L5LwWLfNUQ7QF9DztTi78D7E4fpxMkTH1m5mISKzAIUZ++a8DVZBFYz5ff5KZAvx1xXawln5xKd
 Z6L1HiTfElSKXCdhQBqxj3QbC/yMmrTw5la2u2Vmfs9drex+UFZ3FLoOZ4ABgv8QC5D4atXA4Ol
 ql26hEcnNDpf8IzOX0myuHgQ6ulPqfUbLm8i4LRnpqFwqzQTv74+seihTiiTRQHVoAmtDpg00o5
 YJ3uikiKpq9ocTtMAN3mITSegWPZIDLgUORJr33fbFJ2ISDsywwTxNQTa2BojMW8jUbnxP4Znpo
 RxfgDu3Fc4/zB+YFrBC2aZNTanBPhQ70QmmLQsX/qOqAZsGekadoR2KEsd6U/ozknfL2osnbiau
 dB4Hcm+6dJ9Xz9RyUQA==
X-Proofpoint-GUID: wLPtylFvLV2oLBNlPqIY4qoRBfQLueh-
X-Proofpoint-ORIG-GUID: wLPtylFvLV2oLBNlPqIY4qoRBfQLueh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93187-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56B4414CAB6
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 01:10:21PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/13/2026 5:34 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 12, 2026 at 06:35:19PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
> >>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
> >>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
> >>>>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
> >>>>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
> >>>>>>>> opt‑in by specifying a Gen2 image through the Device Tree
> >>>>>>>> 'firmware-name' property.
> >>>>>>>>
> >>>>>>>> Based on this property and the availability of the referenced
> >>>>>>>> firmware binary, the driver selects the appropriate HFI generation and
> >>>>>>>> updates its platform data accordingly. Boards that do not
> >>>>>>>> specify a Gen2 firmware, or where the firmware is not present,
> >>>>>>>> automatically fall back to Gen1.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>>>>>>> ---
> >>>
> >>> [...]
> >>>
> >>>>>> To avoid accidental matches, I can switch to an exact filename match
> >>>>>> instead. That way, only the specific Gen2 image (for example
> >>>>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
> >>>>>
> >>>>> How do you detect that for the OEM-signed firmware, which can have
> >>>>> random name?
> >>>>>
> >>>>>> want to use Gen2 can opt in by naming the firmware accordingly.
> >>>>
> >>>> I Explored on suggested alternative approaches and seeing some limitation
> >>>> with the both of them:
> >>>>
> >>>> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
> >>>> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
> >>>> the version string. The issues with this approach :
> >>>>
> >>>> - the version string has no explicit marker that identifies Gen1 vs Gen2.
> >>>>
> >>>> - This prefix is not a formal ABI, and it is not consistent across SoCs.
> >>>> Each SoC family uses different naming patterns in the version string.
> >>>>
> >>>> Example : For SC7280 Gen1 we currently see:
> >>>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
> >>>> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
> >>>>
> >>>> So the driver would need SoC‑specific string‑matching rules, which is hard
> >>>> to maintain if we are looking for a design to address all available SOCs.
> >>>
> >>> The only SoC with such distinction today is kodiak. So we can simply check:
> >>>
> >>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
> >>> 	hfi = gen2;
> >>
> >> Agree, this works for Kodiak. However, Dmitry was also referring to other
> >> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
> >> generic way to handle that check.
> >>
> >> Also, please note that the Kodiak Gen1 firmware uses the string
> >> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
> > 
> > This is not quite true. Kodiak Gen2 uses:
> > 
> > $ strings /lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn | grep VERSION_S
> > QC_IMAGE_VERSION_STRING=video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
> > 
> > A collection of versions quickly captured from what I have here (for
> > different chips, but for the overall picture):
> > 
> > HFI Gen1:
> > 
> > [skipping prehistorical / museum data]
> > VIDEO.VE.5.2-00023-PROD-2
> > VIDEO.VE.5.4-00059-PROD-1
> > VIDEO.VE.6.0-00055-PROD-1
> > VIDEO.IR.1.0-00005-PROD-4
> > VIDEO.VPU.1.0-00119-PROD-2
> > video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6
> > video-firmware.1.0-7da9db401e417a006ef915d6c4323f00cdbcf40a
> > video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
> > video-firmware.1.1-84a8080bf84fa9ab15b353bf03bea6e548d89d2f
> > 
> > 
> > HFI Gen2:
> > vfw-0:rel0095-d1a9e7c4a274aa13e4136500d19262f87ef2c921
> > vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
> > vfw-3.1:rel0093-7925621ff52ecb7b1565341042c4e5ffd4fc76ce
> > vfw-3.5:rel0040-1ded01d0e6dcaef08b8155fd5a02f5b57248d5ca
> > vfw-4.0:rel0045-25b39e81446baf48716df98dd37099a2103d36ee
> > video-firmware.2.4-48ec04082362ef1922fec5e20e22f7954b11d736
> > video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
> > video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
> > video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693
> > 
> > It seems we can assume that Gen2 is:
> > - vfw-0
> > - vfw-N.M
> > - video-firmware.N.M where N >= 2
> > 
> > All other binaries are Gen1.
> > 
> > Also, we don't even have to query the binary firmware blob.
> > After the firmware is started, you can read the version string from
> > smem, saving us from strstr over the firmware image.
> 
> AFAIK the video/iris firmware doesn't populates its version string into
> SMEM by default.
> 
> On venus, the version string appears in SMEM only once the driver
> explicitly writes it after receiving the version info from the firmware as
> part of an HFI response.
> https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L289
> 
> 
> Iris does not implement this SMEM population path today, and the firmware
> itself does not publish its version into SMEM automatically. Because of
> that, reading the version from SMEM is not currently possible for iris.
> 
> Also, relying on HFI to retrieve the version is not viable for detection
> because we cannot issue a protocol‑specific HFI command until we already
> know which HFI generation (Gen1 or Gen2) the currently loaded firmware
> supports.
> 
> Due to these constraints, I think, the only possible way is to extract the
> version from the firmware binary blob itself.

Ack. I for some reason thought that the version is populated more
automatically.

> 
> Thanks,
> Dikshita
> > 
> >>
> >>>
> >>>
> >>> Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
> >>> solved for <=8450
> >>>
> >>
> >> Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.
> >>
> >> Thanks,
> >> Dikshita
> >>
> >>> Konrad
> > 

-- 
With best wishes
Dmitry

