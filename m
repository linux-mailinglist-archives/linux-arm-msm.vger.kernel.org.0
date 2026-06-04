Return-Path: <linux-arm-msm+bounces-111147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hnPMF+8gIWqs/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:53:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 358DD63D5E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:53:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UsvTztIu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NrJ+I78t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111147-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111147-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED6BD30558F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F15F3D9045;
	Thu,  4 Jun 2026 06:52:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206863CF041
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:52:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555943; cv=none; b=OwhiLT/IwXcwAY1ui4ZQdtj4Fa+Bd9Trek2wmfLeR9x4xV96MONwCDmib9QuL+F8kWSLKiQbBFtIRNyV50pZ4z2QlKyVN4sO/b24J4+4FU3GC6uAtIGoXiOMQsl0dJ52ylkMPyeE2TQPpBvfmjY3yG1RAvWgfeKvC6fwX1Qr7qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555943; c=relaxed/simple;
	bh=GY9HWYcYN2vZxgT/IMPbqLYpuIufDKnKhahxeGgORFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9QTFuXxAvtFXWRNxJVYj85PDyIQBAWWJLGawHvgwk9KuspU8m5oMROROcUADbjPiL2wsUiYbQo5hPI5Oy1417+6EQWa3Yl7T7yI6BTqqK4/+FmdA/APzdkKrVu6CWcbRxVh6FpU6GRrhlYEmlioykCwaL+CxFI0Qb0YktuG62A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsvTztIu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrJ+I78t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6545PfWA994532
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 06:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QH3Q7a4QvIm0LvJnWjiUGy2awEMq59GNhr6w+819oZw=; b=UsvTztIukAjLYmBe
	JIt0gPAqHJgHNuaWhw07hXE6Yj0D0umA+iNeSyjT8pdpP99BdENsPRlLPNm9fjBM
	CCz8+7MuuUsT9z4V1D0wyXO00okNExyq1lJn3s7p7AoegTBharldE8s8kvu3dH1Z
	YreOzaJ3q4BPRyjwfjKdiPnRxxx5zbuuZ/kdey0z9vbJ5hrwLrSzFl3lGPCxfz2O
	CJ2+iw8jW4iaHMFMTGHMncjzecjEjTnY4de5A7EwFXn9qSsIHeuoO1/2e0XeTp16
	J3ilqimm6Tce1w0yMDxOVlWZtajLxhKAvZdc1SHWrLfk3jqt+7jJ7ipxAMtwDVob
	MlNeTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374r8qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:52:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51772325a64so4537891cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555940; x=1781160740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QH3Q7a4QvIm0LvJnWjiUGy2awEMq59GNhr6w+819oZw=;
        b=NrJ+I78tXCpJGH2tMKNgZ2cFm/JSTI8dliXPJTX+hhbMS6MOCyrRD9AHqLhL3n+MAh
         0E0VcRIGzlI9zxhn5m5VOww+Eu3R5sQuN70R3uQJoJ+04aiN4DGMfGnHhKAx2FGNfkyb
         Fl5H0Mf9W+DCF57phVPheMjN5NkAdQTnCnRL4tHv2uIyzb/XPOKUvwUR3cc1wKImw3A9
         GBRV931s5wwAdOHlDNmR7dxlax5LuegmZnKRQ1fTB/l8cyXL2zNGvjAZnZj6fIvpj1hU
         kcdWOCq5yFQtnFE6fapsJYcR2jxychFxWMD8s0PkSqnJ6EsQ9phiMUta5UcIaSKECYe/
         2bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555940; x=1781160740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QH3Q7a4QvIm0LvJnWjiUGy2awEMq59GNhr6w+819oZw=;
        b=FdunzN71muiAhZ4kJB75y0m606K044n250CHlzxVhA6D/vAQlsif/trXXEfR/QfLyJ
         BCpiCRLCod4Y1Z+qNOvBzKZkwzfNeOFplmsNXCd5hpDaWcb17oLY7sdqx4Kb/kAtjf6Y
         gatAa/lOaNvTsJ5G03ysPSlq01Ej8ktll7XItL5Se/CHXL1DomFp4/miHQnF86iqtsci
         2P7gcOMNRDUoRwJUoDyg6jEvVdGdiN4JeLaO8sqbsp3z9Y0ALtItxsHHBNCzA3+yz8il
         X3AbRdwNAYNeJgu5STbAA+ydJ++fqilNefenDt52a1n/r5S6azOc6AaVPh38PDV7zney
         QXhg==
X-Forwarded-Encrypted: i=1; AFNElJ8pT3ACsGV6nJlj4qhk30ruaSubqDFxAdUcKmvbzph4inFhDBVEwE4f0VqtMDPlVsOEOu+dfNNPpf3GXomz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9g2zU+6yQkUJN/Tvi0eiVVCju5jHD6rt0q6VvunqzXu20W6Su
	mXdbEJaEHgAbQEbx5W7h5r91poyL+tN0Vn7Ik+xXtKaYBvjEdaGjAiiyI2Yj4SC7RgAiRVpLsSm
	VyyuAgKCieycbKmA3tq5B4yR4KOK1gYPFfIHtV1mKjx1PXJEoxP50TY/01+bew/JeQC8U
X-Gm-Gg: Acq92OFHiosWn+FvZ1726NxdMvd7gLNFEnKGt6i3ubD9tOTraIGpIBLatLl+EolVr/v
	qb5HY4MGn3FigaKgPjkRvapoTBk/8PHA7YnhBN1dXozYMTQpcMUn1A2TKIex1mbDOOV7Icfzs+E
	s6CeE74AeSAvTH/JFchfVEtnt7Jot9QebRSjkZG8L9nGHDohT2MuNNx8uf6iJ6rQFAbxWkQduAk
	AjL4ITp8OwFM5yeZuUy8G0OZXIOWRDZLFgPFutWhuwx9W3g2fG5RY7GxfDR54AGd22jgSIzPSKI
	cL7t3Xwz1MWPm5O+P9Rrh19M/SyHUR7h5fcJD+N38SSQA+LIyupQyBeHX7yn2M3fCWpeYeer1w9
	Wz8wIkuaghuDQD/nl7t7RZjqAdhG1WFK6qEZO+mH/tTg10nNpyVCwVUnIMEYcpb0E7As=
X-Received: by 2002:a05:622a:d0a:b0:517:85d7:f5cc with SMTP id d75a77b69052e-51785d7f8acmr41866591cf.16.1780555940321;
        Wed, 03 Jun 2026 23:52:20 -0700 (PDT)
X-Received: by 2002:a05:622a:d0a:b0:517:85d7:f5cc with SMTP id d75a77b69052e-51785d7f8acmr41866271cf.16.1780555939874;
        Wed, 03 Jun 2026 23:52:19 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e06dddsm262483066b.36.2026.06.03.23.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:52:18 -0700 (PDT)
Message-ID: <9d0224f0-efb7-4bc2-8f09-70a9b4d62810@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 12:22:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] media: iris: Add support for glymur platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <kunwuij4ntmh2hwxdrfwlpiza7kbcwtdlty2cai3xlxybkn2er@7wmo5irzum44>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <kunwuij4ntmh2hwxdrfwlpiza7kbcwtdlty2cai3xlxybkn2er@7wmo5irzum44>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NSBTYWx0ZWRfX5WifTfdrOKsJ
 8yBSHZtj/p7nV/z7oWWeeuznWyolm4o4fD+JsfJo+Z0nG8/3md5iaPiHOsfBLnnJ0iVn8xQ0N1m
 86Nk0INNtd6uEcwvPs5CdiVpg5m1sqUoNhTt6g7NWdxdqHsjH37ZMHwwtxm5DfkO4KSg7H3zKPz
 cAySqmdXZi8mF1KEeyFzeBwLTEY4xoo9kIxExqZgztCFAiMPXH6Qp65+bOsXyK6A+nKqDQS6/fO
 YDw89wBcHdmgRb5NCZoemRaMtKCvBXJ6ruyOve4MCp6P272DIkoOEh2OGzP/m4YNWcODV9s8c3y
 DR4CNx2czu6DkR5o+vycosAIjAGh5weAF0y0JIRa0q5zxzFbn2HPTgwk2oGTWFHij+q0smXMAr8
 mvmgYVBNuOTD4SKHzvmJcKvLVOoeX9smrrmJK7AWYYnTbevbxXuc4+6OVXImwD4FI4GoEgTKYAS
 RNp1DVj31dT8LOK1UpQ==
X-Proofpoint-GUID: WkWmVEzxvr9smeIibvGMcqg_wNioAM9K
X-Proofpoint-ORIG-GUID: WkWmVEzxvr9smeIibvGMcqg_wNioAM9K
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a2120a5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=QLLTW4K7kuvKcNWOCmVsWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=MmbEFYbivRMSk88UmGwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-111147-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:stable@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 358DD63D5E0

Hi Robin, Will,

On 5/28/2026 4:24 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:51:15PM +0530, Vishnu Reddy wrote:
>> Glymur is a new generation video codec that supports dual hardware cores
>> along with additional power domains and clocks.
>>
>> This series adds platform specific support in the iris driver to handle
>> the extra cores, power domains, and clock requirements introduced by
>> glymur. Add support for firmware loading through context bank firmware
>> device.
>>
>> Dependencies and merge strategy:
>>
>> Patch[1-2]: IOMMU maintainer need to apply and provide an immutable tag
>> which can merged into media tree.
> 
> [...]
> 
>> Vikash Garodia (2):
>>        media: iris: Add iris vpu bus support
>>        iommu: Add iris-vpu-bus to iommu_buses
>>
> 
> Robin, Will, do we stand a chance of getting these two patches in 7.2?
> Or should we use some other approach?
> 

Could you please comment if the patches are good to go or any 
suggestions you have ?

Regards,
Vikash


