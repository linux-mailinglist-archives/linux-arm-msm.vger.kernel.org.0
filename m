Return-Path: <linux-arm-msm+bounces-106680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMt8LDjc/Wn0jwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:51:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9D4F691A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A70A830398A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 12:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235863DCDBA;
	Fri,  8 May 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEc5OrVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DascmWg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45563876B9
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244609; cv=none; b=czCtSvEXdQf8Tg9cbRb3qjFa8dAMgJ9DX2JS8kTdKlz2srcGzqOIA8NwfRnLTfA4CGfFceImoAB7TIywEPI3fqzMAKLZcbKWnxMkL/OrgwcBMTIHovp2ySRWIjkYqGEg6rAetm1SKOF7dNrkag5xLgco+forN7xBY15RezjoEOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244609; c=relaxed/simple;
	bh=zw7g2Yy6gSTJR6AEXuh6Ij4LgD/Ye5RZbXDj40piSG0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dtacrr2cN3U7KtDSeoPNfV38GBrtMSg8bUTSilufcLkkmzOE00I/l0z/F/tnR6B4xR8fKzpv9lcp78CBXx7+/bFpDyQqXumm3yi2dLnlD6VkDNcQNfkI+YBxB73bZU0OlEQdY598FDQqGImkzNebClJFmw+Skoi48/KdUeVONWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEc5OrVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DascmWg+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648CGqFI852271
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 12:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fgy0grFfJFOerAGbvrwoD3Um+wI6cGrkAGMGsBcSdPA=; b=AEc5OrVjL0wweDjV
	LM81Ei88lJb9V/aW+wrlAueL0bNYeUkLPYe0l+CJNzj/JElm7BvQz0XzV9DFrmIP
	GYDFojJHOv94qhRiJiTOT6yu4uI7y/fhkDg+aRCHSL2EW8IgnTZ/6QkVBntS1qoO
	lRTL7yYuDUhFCp5c/aju0VnEDEIDPJPIg2XI6YMadvqW+ErAoaxhtYq0pRyULRCD
	UzbSQFhNpMzl/Iy0nFpEG+rfwZbItzxywgVNAqH9uxxn0EIA7gEz0RNq3j27Kt1v
	qY7o3xM1aDIbqYysgh2U4hq0EcLR+vNt3jM6UBDUXyvWFkBmPGwrTS8jwgGUCLCL
	OoEH3w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fptg3wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:50:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f50f4b826eso366132eec.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778244606; x=1778849406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fgy0grFfJFOerAGbvrwoD3Um+wI6cGrkAGMGsBcSdPA=;
        b=DascmWg+sWfm5gGWxN10T045Iqtf2yCDCB+jqOTryL63ZtsE9ZQ/hSNYyrbD/SUal7
         BggJtYeHlYkHpLpO9zNBOEwxh2KFouFdkr4TtDDG/8mksNnwmixVftb0XYcoed8t/Vqa
         wbGjT0JUmeHP3z28xTeA37gqCrCl7WAOaByAP1muhSYnXqz2TRa2zdvz9NJ+qHiV5YKJ
         c9hrR3MLhZ9wBRBNIKT8uYOYYGRP98wBqcClZKQOojRfSr0FpgjKt1D5ifIjJJ5oaJNC
         T6TPj4JLdJcqjkXw1JtePOPTy2kr3U05S5tBkwoaLUlvo2/3YXe3CbbjMITKTYAxHGgf
         wEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778244606; x=1778849406;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fgy0grFfJFOerAGbvrwoD3Um+wI6cGrkAGMGsBcSdPA=;
        b=klsrEYrjZ5rf0huBGF4PWAG9J/He/6YkftFTfLBN6RlUqlpijKlZ5XCKT2u7haeAlf
         N718OWE0gYpOXywjAXUaPVuwUu7KNULSKQcjDU2TOygwOvRFLAHg3i6pq0zDEl9g+Y8I
         sRh2oeJy7bNQKLateDXN8mmf583bVuDPRkhvhR1yy4HiU6h7YAf7U1wrnXx3c3igBVcT
         mRDs33sgHFGqyKHo6hIZ/RVRiItOa+OYO/GkHV41iZwc2DY/5HqreLKlVyLaxT/UG0/T
         iVmjxttwO2kiSrEQEbiuKYvWv3KDyhOLgoJ1jNl3jW9pK1vKxagAofHijJm/ub0K/IK9
         Ax9w==
X-Forwarded-Encrypted: i=1; AFNElJ9hHH9y7aeQiAaiDxk4c/Q3gxq4P9DeV+DKZf5KS/GcJvoH7/n2vlD8+DmNIXrrjQcD0djGffoOxw8gj/Is@vger.kernel.org
X-Gm-Message-State: AOJu0YxWj/x9NfqUCFe2lFfrpfrff30fTf3oIlGk5XXqJ0fBUNUOwlXv
	xkksG2tapradnUC2R3czGcKvJeEZeYe+E4HMLNELP6VUGDSZfZzNXo4avfwvYMsIfEH+8yITp9R
	d9SaQsk1aiwemJzhZ8NY+MHDRtUGvp5vCuwJiN0f7YmUvs4P+Aq94/b+DuI3jXkYeR9ON3uA/TU
	2D
X-Gm-Gg: AeBDiesEianx+Q7uWniDS2WACpXE3NAyx5i54rfIE4TQhLKbzxsoYiDCgoSFrv4jUsk
	RWuX+CohngvIylked/iBdedlT4ywLFxbKPt9LGRA41eVbdsru2kVzZTJ72+izWq6N453dKDwhGR
	Zt5QJxYLeZKab1/hox4c5iMaeJ/gAT8eH7PtMppbo0ipHXIEhjrzbhxu7zdh1Bzd0dqesRmBejC
	LVCT8pGo+ngYREUgSmy34isnIxpPxZVCyIngrsK0ZyTNvaDzFsxP534irL9PpeQdnTm7TuPSlFb
	KZThcLSL9FXyK8c1da5AhUl/jsaes1FBIver23cR+qW1AB6hfk1PxIt94Bj8nfi7D3/TxhIRuvy
	vRY4r2F/+ingoDSBu01e2+xvlcLWsy0KEFR0vzy+QFVs=
X-Received: by 2002:a05:7022:68a9:b0:11b:ad6a:6e39 with SMTP id a92af1059eb24-1320b6fa279mr2355536c88.5.1778244605502;
        Fri, 08 May 2026 05:50:05 -0700 (PDT)
X-Received: by 2002:a05:7022:68a9:b0:11b:ad6a:6e39 with SMTP id a92af1059eb24-1320b6fa279mr2355521c88.5.1778244604928;
        Fri, 08 May 2026 05:50:04 -0700 (PDT)
Received: from [10.239.97.27] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132781103e7sm2635918c88.1.2026.05.08.05.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 05:50:04 -0700 (PDT)
Message-ID: <b66ea442-2c02-4662-b5de-f5482736ef7e@oss.qualcomm.com>
Date: Fri, 8 May 2026 20:49:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] Fixes/improvements for the PCI M.2 power
 sequencing driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yL3Ro30hzDTdFmTlbBMWP9SffUhXhv_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEzMiBTYWx0ZWRfX24UCX89ueQJB
 jVgjRGreMUvqhH0ij3nkNh8W2cHKpStRQvNGrQvUXhJl5RC/zFzsnJNKgenINfnRPs2IAOHQXp8
 mRg0BZ3DuX3KtUqbffWK5qiYccaMFO5PSPpQ6bGgVaEq6XT2H70nyYA5ZUmkOcv+CLhFGGurgg/
 yjKOn/TsBD3yVa0k4pzy+2xUNb6F5aiP322IapidvTj2hBdkLBDTzofjB+wsqeO8V4PqmQTTH+l
 0dRjNzVQyBoTcdj5JoR/L1a+/k5bqW/gl/mW3+RJdYkYckqY1VQ2kKYiexLVDFY1LzExzQvyv3I
 CCFLKKO0X6TEyC9N2bWnRsbC7dlgZIoRPkiTc+htGvA0XFypWCVVib8UQHXBb6HQfAdVbgtTUSv
 A9o3sINgTTvaXMUgFDvN7R8PyNeSXy+xATo/PRdcf0CrmlEHR4mtl5uhWs66RUT2cIj7Ex+j+bW
 WhmgVFtFbJZYZj0cSUw==
X-Proofpoint-GUID: yL3Ro30hzDTdFmTlbBMWP9SffUhXhv_j
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fddbfe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=qRrKk6tSi6DhAyMAVQEA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080132
X-Rspamd-Queue-Id: 59E9D4F691A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106680-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Mani,

Tested with WCN685x on both M.2 card (pwrseq-pcie-m2) and direct attach
(pwrseq-qcom-wcn). BT works correctly in both cases.

Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>

On 5/8/2026 12:06 AM, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> This series has several key improvements and fixes to the M.2 power sequencing
> driver and also the BT HCI_QCA driver. Notably, this series allows the M.2 power
> sequencing driver to work with more M.2 cards, not just WCN7850. It also allows
> the BT HCI_QCA driver to detect whether it can control BT_EN (or W_DISABLE2#)
> signal on the connector and set the HCI_QUIRK_NON_PERSISTENT_SETUP quirk.
> 
> Testing
> =======
> 
> This series was tested on Lenovo Thinkpad T14s together with the below DTS
> patches:
> https://github.com/Mani-Sadhasivam/linux/commit/29534d15307551b2355eb254601dec511169f0aa
> https://github.com/Mani-Sadhasivam/linux/commit/f4eaacfe647674be200847092b43cdef2194fc55
> 
> Merge Strategy
> ==============
> 
> Since the BT HCI_QCA changes depend on the pwrseq changes, it would be good to
> merge the whole series through pwrseq tree or through an immutable branch.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Changes in v2:
> - Dropped the pwrseq_is_fixed() change in favor or exporting pwrseq device's dev
>   pointer and using it to check for the presence of W_DISABLE2# property
> - Dropped the BT_EN fix for the Qcom WCN devices since it will be handled
>   separately
> - Collected tags
> - Link to v1: https://patch.msgid.link/20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com
> 
> ---
> Manivannan Sadhasivam (9):
>       power: sequencing: pcie-m2: Fix inconsistent function prefixes
>       power: sequencing: pcie-m2: Allow creating serdev for multiple PCI devices
>       power: sequencing: pcie-m2: Improve PCI device ID check
>       power: sequencing: pcie-m2: Create serdev for PCI devices present before probe
>       power: sequencing: pcie-m2: Create BT node based on the pci_device_id[] table
>       Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
>       Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to 'bt_en_available'
>       power: sequencing: Add an API to return the pwrseq device's 'dev' pointer
>       Bluetooth: hci_qca: Set 'bt_en_available' based on W_DISABLE2# presence in M.2 connector
> 
>  drivers/bluetooth/hci_qca.c               |  28 +++-
>  drivers/power/sequencing/core.c           |   9 ++
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 234 ++++++++++++++++++++++--------
>  include/linux/pwrseq/consumer.h           |   7 +
>  4 files changed, 217 insertions(+), 61 deletions(-)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260422-pwrseq-m2-bt-abdaa71094eb
> 
> Best regards,
> --  
> Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> 

-- 
Best Regards,
Wei Deng


