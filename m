Return-Path: <linux-arm-msm+bounces-73574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7FB57BBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 14:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCD0D7B3317
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECD630DD05;
	Mon, 15 Sep 2025 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cl97wmfU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9D91A23A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757940358; cv=none; b=UNYgKw6RzPBL77L0xaobAVGeZxbZM78NzDusjgg1LrK1tH/ss05yKSDVzfQcmRypA47RA3UrwqqlE8API1u/ASzhwTcZjwem2NHfn3QgINsc9RNTNq3Zn+sRBkLPRvSoSWfOsjOH2UnVyanZhWyiaZtn+nJpiHU+NYQPkpd08ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757940358; c=relaxed/simple;
	bh=eI4P548ke3QeFrEKW69MNINL0DS0oOJlV7sl3nEUHq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqTogmzTHSIa4mtatoOqgLAA9OJILPK4kCgg6DaxcaWLvfCwLfmOvmiYr6wKmR30/QOYHAMJfmhAY7AA3K3mutK/7d6MNNxrTV4PJM6blEQ/zw71cY3JN4vI20cGgytkVcPWOqbFSN+GTmJQHWa5ETGZcR9g+mRg+HWouwBsPlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cl97wmfU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FhuJ031687
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 12:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AaEipnFHhzf85OZKccvKdPva
	wLU9TWagjnPpkSlojAs=; b=Cl97wmfUQmILWoI5UlbIpIcqgjCV4gb+/X32szo9
	F66pmsD9BJa1+OH6f01t4olQ23I0dTBlzrfa8VWnOmycGjx7Fm4CuQarjLJR6gxg
	GrCZqcg0HNaGpgaDcPgWdmbpn6TZGwbXNR2qRHnmnfXeDkDnEY501Mhs5MJGtjXz
	EYUcNCk0KVsRwJN+9gltu8HYeUzdbSf4IOtiBn+FwCTUd1gFRmVu9ua3g9qe/V3L
	iCHg6P3sIPxj8mqNLS6rXwKFFrRBwrdb/CuJq0PaygbSSeGIKWnQGZnR0fFQm7WX
	hXkpRIgmHIQ1pF51Edj2hmi7TyNuAihPl5CPlDmAs6dQpA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma4yck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 12:45:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f6eeb20eso162657571cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 05:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757940354; x=1758545154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaEipnFHhzf85OZKccvKdPvawLU9TWagjnPpkSlojAs=;
        b=l623fjNsC0CGdlpC7T7Y7cLm2Ttz+QTYQefy8XxBqgZ/6eMkQgJ1KzedpRNaGXZPZj
         sQCMw5O6ShhbkjVUtf0EwNpKTEytzoLcINHJTnS5lVMKSS4H8Af3l5YPi4Nitig97Mxx
         F/AfbNeV4Bmz+UnWhIqCy1DhsupmI2SkecnFfoE3cRWH/gtAUXpD88yQDExIVcKlQmDe
         FcE1P/Z+8fXyq9PxZetmSfYfvOCorNYAeQitFLGkI7dl65s9XhDggbN5C+WNgcmNtCLe
         ZKr++N0qSs08CZFRY0aLhC985APY1GUBdxxfLGLfhAs3A3P77Hk+Cg7yTVJRtTJzGaWc
         niQg==
X-Forwarded-Encrypted: i=1; AJvYcCXfeYZO4yGw4jfr8xPLCC7Ddf7bua7ImZOebCy56j6B44IezfobjVL9RfIzp6H6Qap0wt8/wAa9uFrI3v5U@vger.kernel.org
X-Gm-Message-State: AOJu0YxfpZtSySC3hD0AaTdkDSZsGWmHn2Vf8cDXjyXKav6zCKr4isoH
	3I8LkOZKdlQgGiWjGj/sbHp0LXyYThQT53x0rhIkbRFqwQKHvPlxGky/RtVdxg5oqjlts4QVl9K
	CVouNMyl2GfOT9TuiLDMV2QpN8Rk2sxNTDAl5GRrsOvbPIZ3aY8xB9/WG3Io/YSFERYp+
X-Gm-Gg: ASbGncsUBwibI6fDF4Y8BVoWK8SqnmHXG9b1YinFNCr0hxJB1ZwrNmNd/Gh9+NrogCq
	i0LSfcwwoWPPjyZaFkks2QirHzw6h8L8jK7/KUr5Ylx4Fo5dF2hNAPcmeAlEISn3Ws4pJS3DUnh
	YDTmEpTxRpRGTEM1RG6GNP4IOkqew3IGEFJjtN2CQHq0+n2Cfo4h2pPPOIQxpY6OxIQn9nPxlsA
	zxIItTFOF5acpy4jUkHQTuM8Ifnl1LvS2agTTv1Zaqec+dZq5kRyCWqgQPugUnYeX79yBMk+m5x
	B6U/U0WKZ5GWqtVCro5M6+4yZFA9x3tFgILlw1Ukha1TC1zFqP3NvMdqGYyb8cUWtNkiSFNDJ1k
	lumJa+DKXP+aOLnrSQQRmEJun5qpaPlcl05qPt4qjPL0ReiqwgGTu
X-Received: by 2002:ac8:5914:0:b0:4b4:8f6b:d243 with SMTP id d75a77b69052e-4b77cf9fbeemr160255041cf.7.1757940353548;
        Mon, 15 Sep 2025 05:45:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG41a2TkFk5ym1ZrQRNSb4lWvtFZsvmMn4u1jpHI4CBoULtQJbND19JSKtPPciMsBOW+4wvvA==
X-Received: by 2002:ac8:5914:0:b0:4b4:8f6b:d243 with SMTP id d75a77b69052e-4b77cf9fbeemr160254331cf.7.1757940352627;
        Mon, 15 Sep 2025 05:45:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a8211besm26346801fa.40.2025.09.15.05.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 05:45:51 -0700 (PDT)
Date: Mon, 15 Sep 2025 15:45:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
        stable@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com
Subject: Re: [PATCH v11] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail
 when BT_EN is pulled up by hw
Message-ID: <5kjgeb2a2sugm34io7ikws7xy4jroc7g2jxlrydfc4ipvdpl5z@ckbdxxnjoh2d>
References: <20250827102519.195439-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827102519.195439-1-quic_shuaz@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfXwIgZu9pyE4oB
 DjwYfvRGqbyv51/q4JMx6r1Elo2KS1Q40I/7Hm1BwBLHeU0bnmpl0A+DgJmYksdq+zYttS4rCpz
 i203Pt+UWHGajVYPmDBCmQ6V7FEpSmOLRsyDzQjKYb32Be1aO2SBhCWKxletUZ2qxeC0vwh+lGx
 QFr1s3eOq50TnZumwtOPeM6vDhZIT3IJvcDaWpOZoM3AQ6TDHV3CoQQBL0R6gpuvothRBJDCNSR
 pkSdaKOUdnWNZI3TZHbtOYY0WestyKSHa/3fwnWhv3PYEZpt4YGjmBRQuQaNymxN+X3V8kmjEoT
 AgICUmSwK3NiA0oF1mQMrvJzR5NdawUIY3PuUn49+J5ir/DcI9PTMZkDj/2dbHC0t1f58QEjSxl
 QFR9S9VB
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c80a82 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=dMowEvKKoQjkIwZx51sA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: RNDbHw-f5yblkw7xuBVSVGDant8kEx0W
X-Proofpoint-GUID: RNDbHw-f5yblkw7xuBVSVGDant8kEx0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019

On Wed, Aug 27, 2025 at 06:25:19PM +0800, Shuai Zhang wrote:
> When the host actively triggers SSR and collects coredump data,
> the Bluetooth stack sends a reset command to the controller. However, due
> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
> the reset command times out.

Why? Does it apply to all platforms (as it seems from your text)?

Please write the commit message in the form that is easy to
udnerstand for somebody who doesn't know Qualcomm _specifics_.

- Decribe the issue first. The actual issue, not just the symtoms.
  Provide enough details to understand whether the issue applies to one
  platform, to a set of platforms or to all platforms.

- Describe what needs to be done. Use imperative language (see
  Documentation/process/submitting-patches.rst). Don't use phrases like
  'This patch does' or 'This change does'.

> 
> To address this, this patch clears the QCA_SSR_TRIGGERED and
> QCA_IBS_DISABLED flags and adds a 50ms delay after SSR, but only when
> HCI_QUIRK_NON_PERSISTENT_SETUP is not set. This ensures the controller
> completes the SSR process when BT_EN is always high due to hardware.
> 
> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
> the comment in `include/net/bluetooth/hci.h`.

Which comment?

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

The whole commit message can be formulated as:

On XYZ there is no way to control BT_EN pin and as such trigger a cold
reset in case of firmware crash. The BT chip performs a warm restart on
its own (without reloading the firmware, foo, bar baz). This triggers
bar baz foo in the driver. Tell the driver that the BT controller has
undergone a proper restart sequence:

- Foo

- Bar

- Baz

-- 
With best wishes
Dmitry

