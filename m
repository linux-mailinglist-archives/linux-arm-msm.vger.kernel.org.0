Return-Path: <linux-arm-msm+bounces-112748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id edLIEf6fKmqQtwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:46:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B178267181E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:46:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DNIkXvKN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xp4MLjep;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112748-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112748-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5E793028E84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DD7378811;
	Thu, 11 Jun 2026 11:46:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0F83E63B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:45:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178361; cv=none; b=sESy6JqxxyK1RPNGhoS8n9vc/KARrKZtCzMJmJMKrdJZ9wVKGPWj/MH+YSLdIZC+RWI/apFevVzU+fIu7lcRfLfZp4tiuiG5hOv9w9e6UT+JFlHqmc4mvnkhngO8zBbkBsUIiITQuczoYeYfLfQxdkIHSUa41kqyuxYkXZUnPys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178361; c=relaxed/simple;
	bh=abYrsQg4er/DWvcjBUneRpAwhi7Z+PK0VEhY+4Qtu4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdUo5/0bzyIPmMgjfRuUkxAfi0SEdaMCnCImMZx4wwqQns3cEMYtyjLiXKwSQWH6Av3XeO8Rol3S8Qwt6TLX3z7qy20WMYYNYoRsisEfdTTIgzb1a9VF6D/+i4rYbURBV2Yf+w9Hlg4FZcutRc95U9HrwiXdRNfcw6m/BR2y09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNIkXvKN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp4MLjep; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xRmr174135
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GoBZuDQQVTCw6DoD5D9JhCuK/QhexAtetwEQkmTanE=; b=DNIkXvKNr8QfzWJY
	F6Ed3/DgN0k+TX0AjDzZjTrJKbmR5bwqmyn+vknmJneBj++S2ItjsQbQByDkHF0V
	Kvxo/byNnZPCGJqltyS2z5IX+y17c6vZz6rKzNHTZWen1VElUHM2CS2wXKG4vnMY
	/UAxnP0vMr7hglKS2aT75VsHjMqwQcXE79oqgY0Jw+V8OULdP0lUX0ELU3cIPeiM
	WXEPtHPpNEjNGAZ4JEgo2ExV/hch9dNNlZ23z7m+vOqpIIwpP/r26mD6ike9YCN3
	Uk4gpOT5lYw10Rqjg6ETFohtiOH9yZIbOzjMYJz51MeckZz2gi2nO5aRDW+D2OiR
	CAk5qA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vb518-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:45:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517647fbff1so25986591cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781178357; x=1781783157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GoBZuDQQVTCw6DoD5D9JhCuK/QhexAtetwEQkmTanE=;
        b=Xp4MLjep81OYisa5sOdnLAV5+m7svYo0EK+FEElzX3/fw0nsY+gmkz39AmJY38Kyt+
         G5UzXyLS2Cj37PrO8oirhcZAU0Z8v7WW6pCAqMQgq2TipC2W0OxZ3jtlOUz0ebi7g3Um
         HxKHmaPmoMUS+BxGjyg2qff76SAlvA+CDvVnJWME8CmiSlpJWjby/5AsSBam9aaJS8LV
         BK1k0eG8MNtrIkobESgyp/qhX78G3slGfQXklroWoZVEHQDWd6lThIVsqzSda+8ki9Cz
         IRwJqgA9ZV+E+6E0QWaL1xRcDFMiY4RUDp6A2qD7GUuNOiRjYW7URvvSU/4QslFwZ4ct
         Bz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781178357; x=1781783157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GoBZuDQQVTCw6DoD5D9JhCuK/QhexAtetwEQkmTanE=;
        b=fy07Zfqa8N8CUJ1tiQCMNstvV8fCvddTYSfdUNwh0Qysk6cqVisgkaiYbOea7sBBA/
         kfVczhl/RvxN7Mf05FbMtHVBv+rXHFSQucXyjJNVzJHbX5sgtOOZ1VY7TfW2yZZr951f
         HI7g6ZKqfIxD+bsSzICgLDMXlBp7nOJwbwXTQa+bZyIT+DDEVSj9Fcpq2EtAJeg74jEz
         mqSMCz7int1yY/rC4F254aMw7OUvUrQreXJEzDadZd8dgFmTAg0xBn26psqKgb8LF8wd
         yZ5nB3nxki8fvAcYB/H7NOXfATxKC4LTFAowCeUjyhFbwGq7vs7eoNLjLawjtRNLsxnq
         CtBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pswv/5drlJIfl3UZ+n70jFmPWsuEQQvlYw3o4P73F+VDvVq2J9uD6O3qXFRqa5RDR4187AaXV2BQi0roy@vger.kernel.org
X-Gm-Message-State: AOJu0YwwvsVuYaKXmooyVabS1uWuSltCeX0OF8cm54E1xBHC7+9harFf
	oecgCOBl67CGdiZfBz+Hv3Ms0ULswCh28SBmoE1MgYm0UfbNVjebXgq/RhE0wij1T1RQ0CPOV+j
	gCibynosBlGM13v23mU6PGfP8D6+DVMKETOI0GGk1dIieFrpYKoAskB4suh23CLj1+c2E
X-Gm-Gg: Acq92OExtJztu28o9uY0XadD49dNYx+rNbpX0baBLtnKIlkRQhOpTaITU1z0LqDCL4v
	+TKyNTTW07oUtejHPkUSMYpmtlDb6+VhGzZMCsESVGFeWYM+350Uo0l1KrcBd5DtQMSvdPsU864
	6DYsqi9nrUz6TVzSfrqKmLHQuUnDJlhyXtk3YdH1fsStnP0UiNu0KVnq/WMLPWYFsDGATbQrVzh
	LY19gZo0oVkQi34sEZeY6Rf1Z0DmyEQbrBqV8FPzd+OZoml6xsgOTlOTiM9Evqj1AUQ5u3Nmcxn
	Ku/t56N5tkM5oVk1Swnvm4xIErFZ/KR3NC1yEylksFmlDzdQFfLBkwjaK6SLNJuxpFvUB3NdZ+v
	3zbgSwJLU1isBycsmzLUk1QWNWWUd0BUTtef7HTK7jGC9ZMboH+vutkVC
X-Received: by 2002:ac8:690e:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-517edcd71a4mr23729251cf.1.1781178356898;
        Thu, 11 Jun 2026 04:45:56 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-517edcd71a4mr23728891cf.1.1781178356421;
        Thu, 11 Jun 2026 04:45:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb60b771bsm51473566b.54.2026.06.11.04.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:45:55 -0700 (PDT)
Message-ID: <004d6bd1-2800-42d5-a6be-1fa69a06194c@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:45:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] firmware: qcom: scm: Add minidump SRAM support
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jbElJ8iFfpuGAf5CJb10mg72xAFhq1aZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExOCBTYWx0ZWRfXzH12EBN43JH+
 j/U4RXH0euYGXmObM8JxrdE1YU0Obu13xHWv1T1pi+AG0EjVeU5G5lZWKJXVmBBN45/J98GeVg8
 JTsPtb8TvPxGjKi5n9oNCR70isPM46w=
X-Proofpoint-GUID: jbElJ8iFfpuGAf5CJb10mg72xAFhq1aZ
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a9ff5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=y6rW8TDjuTIuaxCCkQgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExOCBTYWx0ZWRfX41MuFbSmWcqN
 /7Rs5j7ScvHazwEIBFXkRN0lQXd6CxhPLvEn3iL51Vx5Ugx4ZxS6lFjcmEB/+w01Uo4K+JEsKl5
 TaTjwFRhQ6aoU6OU5y2jE3YmZSi1QHQU+3sx2If9Yyj+z4Jz7sG6rORBpsZgKoKNgASReDwgVky
 /LsG+Czk71WgpBR6F7P4BahW04TTvQqfR9K5Dz9gg84K9lEfKNt9pjkwJ/4LZmM7bSSvXVs3uwW
 F+BAlw+CSCgnaJLfjQ1nXTqtRYtexLCoOXjuUaU2oEhclpNMDzK2+gxjvpT3nPlHg5wtO/88Dom
 lVOojzB23hJhHndP6tKv+yLq8LPBKJ7T0c2sHONBgxU14G8YqDU4GDZN55M2pYQaonbinSb0WW0
 BGOQGKZoioEwYjcRrqiCcinatLjIvzQ4vZcIdcmngZVS2XOk15p448COaLBS95O4PrPng1dKcbR
 UJZ7ggmAtjtPdZZV7FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112748-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B178267181E

On 5/22/26 9:49 PM, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
> to deliver it (USB upload to a host, or save to local storage).
> 
> The SRAM region is described by a 'sram' phandle on the SCM DT node.
> If the property is absent the feature is silently disabled, keeping
> existing SoCs unaffected.
> 
> Expose a 'minidump_dest' module parameter (default: usb) so the user can
> select the destination. Only the string names "usb" or "storage" are
> acceptable values.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]


> +	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
> +		if (sysfs_streq(val, minidump_dest_map[i].name))

I'm not sure about sysfs_streq() specifically, but otherwise this lgtm

Konrad

