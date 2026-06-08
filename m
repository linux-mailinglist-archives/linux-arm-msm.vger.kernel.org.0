Return-Path: <linux-arm-msm+bounces-111737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AT0YJ5R9JmpzXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:30:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4F56540ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:30:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AhzRjdpm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZCdm78Bz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111737-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111737-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C1CB3064715
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B940139B48F;
	Mon,  8 Jun 2026 08:14:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC9339B48E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:14:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906487; cv=none; b=OCNPRoneX4kT+CU5aRkrqn+PcAG6FnU6BGIfpyrfuAChd8hhVvjpbCTQpJSPyvhntJTUTSjxB5HxJsHpzSpKbmGTBOkQxyUN7EEcLGZsfWEoER6FoyW7EXBWlUhWFekWttQwfsPdKzvjFKvK2bJ+fjr2oNotUNLRHmyiwdlec84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906487; c=relaxed/simple;
	bh=cTz+CEmaNf4eHDQpnwOU3c1JCvIbyzwOrTtHWyDNG/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ke58Fd4kA2SINHTwVo8HkK95gG31yMr+NqkOqbpiRqEM66yswII01vSkeEBfWj/YrCXyi8fQ2KPICW+ldmE0zNeLIGWf5l9NfzJUs4y9g9gSZQWVJe+Wwxnz6Shx1Ur+VdrTTAoRbmHhjoJ9/0HYvYvbA/8udWkMlziU3Y0G5aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhzRjdpm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCdm78Bz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OkKi2347148
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRRLoMyY3I4u7nHJezOej3HGDZ30vhH6pQAsB8UUioc=; b=AhzRjdpmxx6GwFrr
	gzvq2hVtpTAsgTqU90UZ3SdOn7IJaz7+BEa0Yt51bE+aTxSvoBT0PlUOYJ+PKS7c
	LdDQo2a9q9FmQHtbYDHPc54Qh1WQG8VTsxUjaoILeR3fp+0X7f4Ed92RjOMcfU+D
	VtKWA9cNcolPPHRORcwOfR/QEU8NFCHDIQ/UrZ/VmZlPug3bwrJjf7qoo1dWYOsj
	7eCglthF/uvJkbhPwiNgyR5yYEHy8XYcQaSfAoaNGByZ6g48HS5Yn3suX7LADWEO
	GIiGLpVfQRknKwG7T8Deokxbctks52CAwQHYShFF03TeMwa1veyGsXDokqyndG9E
	3vrdaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrf0j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:14:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177b8def69so87132961cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780906485; x=1781511285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRRLoMyY3I4u7nHJezOej3HGDZ30vhH6pQAsB8UUioc=;
        b=ZCdm78BzWLcv4+ToYGLypi1GBdWEQDbkP7SVmRyyMsLYBvgdXyo+9xcIrxZB/7w0ZE
         cXRmePiiknzwneNo4LyrUOTXSZgLnPpUDXQupjjkFYkc5Oy6tP0UEZ98j9Yq7lxiy9d+
         m2P6ItJWlXBDp/IDL7xrSskS5JoK60ifcGZ+wUa7HOOZjnsDT6DhzXaRcUYtTyDsgQCI
         cHi7Y3TAC+LgiSgqdIc335Gx6+Uo6elqECnE+mbkPqiSKJ0CPpuLyDtr8YNaxz2pANy8
         2HZgHrF1X56iYFwv2kgUM7qpPSS12l3vmcXkYaQ9SAnwBtOMz+Oa8ibV7G+beRhaGMY2
         3YJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906485; x=1781511285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lRRLoMyY3I4u7nHJezOej3HGDZ30vhH6pQAsB8UUioc=;
        b=RaKGiCWTlyS7irVOIvuanF4TizfbAoRzL/BVJxJE7te4GTQzWP8y/0Sr3bgo5tOr+q
         YJrT7nte4/S1vJr9vn9LJiviUkA51/RMxg36O5jHXs4UaRyISn5fED6JVFnjHJ9WXZmQ
         yYPPCsrIflQZatg4itQU5jf+pPlRkYWur8GUjwiumbVb5UPcZ3Hkcdxa/cFwm/rho+ab
         EZGbOypjZS7UU5sRHdgZKl18LpaHGwuJG7W0BWt80oSRKLUJVfr8cuCWTVqgfCtwl21w
         JTC6SHH/MOKNS//Hs9MZerI6A0B9xUuPGvGQVznKec/doNXZzDBmuTJv0FFFPC6Er0Ha
         MC3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+VvG6YSJlfTZNM3kfQSm/Zu63RO1tMFYWmX4ieoFHFYblRBaYFx2Ts8jPOhfKigbr1ol7z9z4DKPmXcdUq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+BDiFbTOa/byP/g2gMRGiUBhRk75sSgbrehO9WygcPEwE5wCQ
	pHKtQZqASuZ/06E6HWtC3upAdNvyuFaLxLt5RNifck/bEHScN4ObnyQQCZLQDKRFW6LhXnWO/xb
	R2xOPiv+hKWOlS4swPvGyEUYmeqQCDjO8aQGLi4vPgEi4XssSG1aQp71c33eF5J6dHSx3
X-Gm-Gg: Acq92OGyjp15fMJvxZ6LnyDilNJ8t40DvRmI0/AccfoBiZ9e3zmm9nfxCBIuWgEeu6u
	3o9LvBvKoO/0PN44hZ5fIYMAprgXzNXCI0QbnldNZLFFp9rNmLFdDVMrfpPm6YWhqqld1mqYzp1
	W10S7EGR1nHyeWb1ZDn03HaUi6jgh2gpKNwNvI3rEsemFwKyoBYHyWuytQC8dMANEVgDH1jBOp1
	lRviv3W59ZdLJiak/vssoIIBDMaZLu0986JVci5XUI1kKyCw0C7vigxHqo/9vMtBst6ys9TBvic
	WCg+3MdfnHlreMwnVIb7uJ6TYhZmiucZ59OFQ2ubjPA3uANIwz5eDxTiv2tYG62GtSkPkOYYn9X
	sBNfbpdWWvUnvX6VdXG76cdeWBXbH3xZXFT0OizoatA6XVM2WxfvjcKI9AUY=
X-Received: by 2002:a05:622a:1b10:b0:517:760d:48d5 with SMTP id d75a77b69052e-51795b1545emr206567571cf.23.1780906484774;
        Mon, 08 Jun 2026 01:14:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1b10:b0:517:760d:48d5 with SMTP id d75a77b69052e-51795b1545emr206567321cf.23.1780906484402;
        Mon, 08 Jun 2026 01:14:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3446aesm54904623f8f.24.2026.06.08.01.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:14:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/9] Fixes/improvements for the PCI M.2 power sequencing driver
Date: Mon,  8 Jun 2026 10:14:42 +0200
Message-ID: <178090645194.42922.8536349476896784920.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
References: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NCBTYWx0ZWRfXwKRZoF9xSvYb
 TuPwlYY+61izd2oiHzlQVWG6E+X2PTFxSoomhxFT5GuMNeSWsJvh3OFl1950/iMqFjWpeNInPfM
 4I+DZsS1BTozYkWPBDc2r1AQyPRdNUn+T8P4gaNSEiTNOf6Rxwmwr13a6+YM4zDo0s5sshu16Zs
 BzkwEyICE9bmtzfub9q5NDx1IQZx6CFsoWUuhftBNpevfvvRAY2tw91+repQzC/8rWJDQXF7qfP
 gFP3vq4ytUgScpN4h8SBq078j1mDkWa8PrhsyCfE6B/Fak74A1CX3bHeLkmh7lGvEyksufFY9UN
 18/pqXrPKsuP2M9BN2zdcfU/W1hLgGMDXCH2s17ljltxaeX5kdUX8pmGm3XP1COvsj1C/ZmqKeY
 5GrpNdqewfZsxiUiB7YqvzdB31j20B349iL6GPF3kMEqLikNRi112F2ArjGpl+tyshuVBmeNCby
 /2SKiBnL/itW9cSgL9g==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a2679f5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vezmLmUXWD6nqp7YAy0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: OH7fYnJPuLN-9R7I6B3b9b-HyXBEeAZs
X-Proofpoint-GUID: OH7fYnJPuLN-9R7I6B3b9b-HyXBEeAZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:manivannan.sadhasivam@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:wei.deng@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-111737-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE4F56540ED


On Tue, 19 May 2026 14:25:55 +0530, Manivannan Sadhasivam wrote:
> This series has several key improvements and fixes to the M.2 power sequencing
> driver and also the BT HCI_QCA driver. Notably, this series allows the M.2 power
> sequencing driver to work with more M.2 cards, not just WCN7850. It also allows
> the BT HCI_QCA driver to detect whether it can control BT_EN (or W_DISABLE2#)
> signal on the connector and set the HCI_QUIRK_NON_PERSISTENT_SETUP quirk.
> 
> Testing
> =======
> 
> [...]

To make Mani's work easier next cycle, I'm queuing the power sequencing changes
for v7.2 now.

[1/9] power: sequencing: pcie-m2: Fix inconsistent function prefixes
      https://git.kernel.org/brgl/c/da35b212f8cfd2fb2b7beaf46f4ae758f29c4ea7
[2/9] power: sequencing: pcie-m2: Allow creating serdev for multiple PCI devices
      https://git.kernel.org/brgl/c/0822425512762d492d7d1500a38d8d519a2b96fe
[3/9] power: sequencing: pcie-m2: Improve PCI device ID check
      https://git.kernel.org/brgl/c/8ababf888685c3167f49c77bcfae6f82bf661be6
[4/9] power: sequencing: pcie-m2: Create serdev for PCI devices present before probe
      https://git.kernel.org/brgl/c/c4be520907a42981fd32736b6eec18aaaee738c8
[5/9] power: sequencing: pcie-m2: Create BT node based on the pci_device_id[] table
      https://git.kernel.org/brgl/c/f2aeaa6d47d3e94285b6ff648b929f3eeb5ce600
[6/9] power: sequencing: Add an API to return the pwrseq device's 'dev' pointer
      https://git.kernel.org/brgl/c/9085f71285375485c86c06071a13111606b404d7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

