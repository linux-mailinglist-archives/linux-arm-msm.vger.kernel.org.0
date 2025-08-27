Return-Path: <linux-arm-msm+bounces-70973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 107D4B37774
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 03:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0697D1B63BA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 01:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8671E5705;
	Wed, 27 Aug 2025 01:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hU/G9xpm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370DD1E1DE7
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756259841; cv=none; b=m62lUCyJmCNyDiKUb0Z2sOnn6p385m/DsOWGwT8er0saBvn7j/rLIqFZhgwRp/AUv2Pkk0713apFsSiymQPioeKJVrk64qU+5TulbQEIYO6sfduAT2yBBR0hD6nzFxZYpt1L4ANScsqafskVCi/W10bPE0DZ9yXDaNZHaCoDCUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756259841; c=relaxed/simple;
	bh=r+1XfEORO59jMquhV9Pm2QNKKblDliJN3+Zs8N+eN+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nqe+/w8453sAW/NAD8d5SAMpxE0z/owAQDQsuuftNVvqNm19tie+GZLNsBDpByVj3Gae1njdmd5A30s+mYOjJOZzGdh0vxtXXlJQSsKsjuLdWpic3jasQB0jlYd7HlRopeb42p1Q0ett7hTJQiD61rwupl2BSpHAypRFVJINmrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hU/G9xpm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QL0xFv001408
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tjs/w6Rugmz9OyiMttcxwIC9
	NEhSLG+c8hsBrGYuSRo=; b=hU/G9xpmmMKa/B7l1dbuor9QatKTA7g51k3EsaGY
	AndFvgdieGPhb2vHNvPjh87GOPcBfTr5eea5I7OL/jhJimUKGRbpFeld5Nj1MnSw
	VQphoYgkUBsx8L6+FDsIYSw+Mxq7nxvNvt9R7bODrALivkX9tVkRNFYQfCNAvDO0
	mGObapZUutJj4B558yEu9/kZcicrDscnO60arU4mTL7JsUIDYoupqxN5OuopbpOx
	UA0xJB3zqiZK890Mi7abQPI/3gEvkb8HTjFR/nW3wjRdCCuPab4Dtx9pPGRS/tI5
	pTP0j2fCze8MarAuet2OCgGXyz3bmkg2r8WXfDnnSyt8KA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umb36d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:57:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109ad4998so237462811cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756259838; x=1756864638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjs/w6Rugmz9OyiMttcxwIC9NEhSLG+c8hsBrGYuSRo=;
        b=dbCDkOA5xzaQra864lThM6WW9w2VNVkmSoByoVSpIKO5HwcUMdHfnlG0C7chG4ugnv
         d2KewwifGbzviKE+qh62P5RDqBk4wH+NgrfRuDpdC78QOEi3QBr1PDNdXeb79j8uI/J+
         DL6zskbYT+Fl8JG+Keg61ywAEpodOeviDOJrH2l1rx0PJONVwFh05HD5feHKxc2ekpOf
         0EoRCx07geAuNLhESehqCOKhGi/nqtMaXPSnMg2FCyYmD6gCQZgRAytCCOIAA3TkJxaI
         aFQefLQDNOiEYZpNjBZibOAxvTdEseeaWNlx5P7XkhYCqAxyvJCqIlovcN3kBXv1qqYE
         CoOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKhCipLys/oJ8XJTt+kcLw6E8jrcVC/u//vt0Dyypga+LOkTfcEuB8YmBQe/avTyYmXOpf6DBO0a+69ypM@vger.kernel.org
X-Gm-Message-State: AOJu0YweqrD6z43oPp1Z+iJCgjRbuZTZ3kcMwdwF7MFZQcVj1Npvk9My
	aRTjo70ZQof63921JN2RjxrRPDP/KTZs/1ishZCqTPkLoN7hfhqS6aZHrSsSR6LxxlntLOMvXME
	kdmJXJoIZlMWZERxUvH89eYXriW7GRMFbDj1aVdVBnyyynq0N5k+LQKpFeTMhTjQq/XU/
X-Gm-Gg: ASbGnct9jenpuUI0a928UoN5Eo4cOSdlDjBmLbxf6g9C2asVVGFkYvOtM+PdrDMTDJ5
	RAfYA9W+8Xy2V0Jsa9+44eB5TlPQmT2J6LPr2v/e5s2e87EkaHXqi9VewEsuQAWNwmlWBsTkuNu
	DudXAWGAbo/PvfZpAXXNfFzi5rsfuB4hp22gA8XUo/Des22sym1N3iMzHvm91gHDIx2HEnfCljA
	JG4hoByMTwDtN9mj4H2awXY7/HOUwpCLcWeys9u/ZUAbkaRgoRN61hayCAuq/VaAdnSlSBsON47
	vMARTzoA/5nqA5MpBVAhtttpa8eDBaMOQf7vnEtNPwdtieZum/CGNGhPDJkco+bwjCmuNZxqgt8
	WVbGjPBHn9VgF/N8cW99Uqzdx6SFp6X6NU3Q+ADfn0ry3Z0FRMg3V
X-Received: by 2002:a05:622a:5485:b0:4b0:e93d:8752 with SMTP id d75a77b69052e-4b2aaa6e4eemr227657071cf.37.1756259837761;
        Tue, 26 Aug 2025 18:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNcffuYMtkF0UrerifJit2fOix76wByWZmgmXEEbQpG6a1LmiRtbpsz46LSTWotCAlBbM17A==
X-Received: by 2002:a05:622a:5485:b0:4b0:e93d:8752 with SMTP id d75a77b69052e-4b2aaa6e4eemr227656911cf.37.1756259837245;
        Tue, 26 Aug 2025 18:57:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f52453de2sm296165e87.100.2025.08.26.18.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:57:16 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:57:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
        stable@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com
Subject: Re: [PATCH v10] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail
 when BT_EN is pulled up by hw
Message-ID: <lpndrvnjklmqglg22y7fnfeeyrp6odoedixosjc4n2jygeq4ve@ootpynfw5zvs>
References: <20250825113858.4017780-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825113858.4017780-1-quic_shuaz@quicinc.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ae65ff cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Xgb9nbmtQSVvgoRKimMA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXx3xlo9Hxi2U8
 k+EwrwYZtN6SxcWUxZN41BOkgqf+7qfgIEs5R2cRwISpT4X8rQ42UQjs9yup4hbNeA5T0CmMQYE
 iwMdKZHh1BqDrmKnU+hgUc6Q/OeXHEVqDmB+DvAotUYZyyHfij0EAcSbOujHA/6+3E6V3dmSyIT
 R7CvSDd98KtmrD3nXUH8a0L9CTRzSD9yCIYNfP39rkjcMhnyYhHrX9nqSuj2lzkHnCvqVXmGVZY
 Zl6QcWRISs55mQNxvxigNP/LJKxciDtUxIVXvP55FCd3z2RwDsR9QVp/8kSBbNyjl0r0X58oPYb
 ql07OptD+KTHM/uavZG18cNhNqvhqcGl/hdOp7UnYMET279tOhAfKLgk1/CDsYtpJ+ZxC5Ia55f
 VEO+dVvp
X-Proofpoint-GUID: 8dsynZTQUHWfP1piZYjnWgb7JGtX1zSc
X-Proofpoint-ORIG-GUID: 8dsynZTQUHWfP1piZYjnWgb7JGtX1zSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Mon, Aug 25, 2025 at 07:38:58PM +0800, Shuai Zhang wrote:
> When the host actively triggers SSR and collects coredump data,
> the Bluetooth stack sends a reset command to the controller. However, due
> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
> the reset command times out.
> 
> To address this, this patch clears the QCA_SSR_TRIGGERED and
> QCA_IBS_DISABLED flags and adds a 50ms delay after SSR, but only when
> HCI_QUIRK_NON_PERSISTENT_SETUP is not set. This ensures the controller
> completes the SSR process when BT_EN is always high due to hardware.
> 
> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
> the comment in `include/net/bluetooth/hci.h`.
> 
> The HCI_QUIRK_NON_PERSISTENT_SETUP quirk is associated with BT_EN,
> and its presence can be used to determine whether BT_EN is defined in DTS.
> 
> After SSR, host will not download the firmware, causing
> controller to remain in the IBS_WAKE state. Host needs
> to synchronize with the controller to maintain proper operation.
> 
> Multiple triggers of SSR only first generate coredump file,
> due to memcoredump_flag no clear.
> 
> add clear coredump flag when ssr completed.
> 
> When the SSR duration exceeds 2 seconds, it triggers
> host tx_idle_timeout, which sets host TX state to sleep. due to the
> hardware pulling up bt_en, the firmware is not downloaded after the SSR.
> As a result, the controller does not enter sleep mode. Consequently,
> when the host sends a command afterward, it sends 0xFD to the controller,
> but the controller does not respond, leading to a command timeout.
> 
> So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sleep mode.
> 
> ---
> Changs since v8-v9:
> -- Update base patch to latest patch.
> -- add Cc stable@vger.kernel.org on signed-of.
> 
> Changes since v6-7:
> - Merge the changes into a single patch.
> - Update commit.
> 
> Changes since v1-5:
> - Add an explanation for HCI_QUIRK_NON_PERSISTENT_SETUP.
> - Add commments for msleep(50).
> - Update format and commit.
> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {

Please. Stop. I've asked several times to make sure that your patch
builds. It still doesn't. You are still using some older kernel version
as your baseline. This patch won't build even on released 6.16 (which is
already too old for development).`

So... Please find somebody next to you who can do that.

> +		/*
> +		 * When the SSR (SubSystem Restart) duration exceeds 2 seconds,
> +		 * it triggers host tx_idle_delay, which sets host TX state
> +		 * to sleep. Reset tx_idle_timer after SSR to prevent
> +		 * host enter TX IBS_Sleep mode.
> +		 */
> +		mod_timer(&qca->tx_idle_timer, jiffies +
> +				  msecs_to_jiffies(qca->tx_idle_delay));
> +
> +		/* Controller reset completion time is 50ms */
> +		msleep(50);
> +
> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
> +
> +		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
> +		qca->memdump_state = QCA_MEMDUMP_IDLE;
> +	}
> +
>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>  }
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

