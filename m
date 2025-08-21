Return-Path: <linux-arm-msm+bounces-70154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE376B2F787
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 14:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 155C37B7551
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF98D31079C;
	Thu, 21 Aug 2025 12:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m46tIWI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8F83101B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778030; cv=none; b=W7NGBEXm5IqiuZYIQ4ABiF0cmwQvdxjl7McGppY1foWvhpXWg9dNNRaRcJPTKnWDuIS09zQ2Gk84mJPtXDBRtu5hOvfB4jKcbv26wjJw+naQm/tKEXdq+DVWu9/RoDZV/M+mBFVFdv3l+/8N/jpWkOo1varDPcCoQxDFd5yIiNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778030; c=relaxed/simple;
	bh=qzBNWlpscVdbmJg/J6rGsGk0O5Ycp+YYPi+eM2d0F+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlbZFSRnIQfA/p7KXtbDHkFEXiH4w9DDjdlxttEtT04o6BWY6EBrJWTmBmgq+Rwhuc1dKZxV1Ntp3wgaJUq8ovafjdFBkPCxgJ9igCufwGLT0HB1X6IlJ/i0uXYYg10y/cGd1FbomZR6xDzlmCWGylUIuuhe53JpBzSp3cnsZuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m46tIWI2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bJZB007195
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 12:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L+i3kqjxsqUoIuvHrtmmUXil
	Y+sBbXOpRjrBG/uC5/4=; b=m46tIWI2c6vi6x/SMZE3Uo38JDITcbOLC9qzkAxC
	qbL1//jWPttLPYwqOsRrkcP/CTbt5r6nk3toov2WNYaCV0bIgVIf2MpQTvQ3/p4s
	SRYE2ZBcj1il2PG9+8BGO+GXDGhOSbsNydKDBwCNWunoJ2tPRgQ+YFTrMaeUWHHh
	lxtbZ3t80ckVkT38EIgZgoF+zfsBHWuF/UPw0SGlPP4vE+vN2JHyIZZlrbXTOKby
	AGk2iiGLyGIvcY1/FSxY+xYLdKh1orPcyd7Ri1PGEe2QUlYpIIQgI2HpXIhFGE2E
	Fx/Veo+uGKG5c48TXpqVNlJ6UI43vkDNxo7prAgqgxQNvw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5295bhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 12:07:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a8b32a6e3so20960436d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 05:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755778026; x=1756382826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+i3kqjxsqUoIuvHrtmmUXilY+sBbXOpRjrBG/uC5/4=;
        b=F6xNj+jtVEHQQCNmf5SNY7X1CcjI2WkqnTJkpNLfiJOMrNWf8kllQrgTWKNhNxWZFG
         2+RL7MD4Bl0gakzRFPSE3lqWRJotyeR32vZq6eq+e5Fk0XZu+bdMJEpWIbpWd3qPl9rX
         lMbIgVQB4xkBtC475S/o6DljPsv62fEhnz6NMzzJu+TscmPLUjFvqo4a1FSX3yWxa475
         l4HiTEI0MF/BOq3deAtJOQ5G0gyab4oJpGFJMa0NfmQBfpZX4BAPzTocx/RThiO8TGWd
         kD9P9TBVtrKPno7PQjLOoKzZRPJkP+/D6vl+7hT7tRDGLWfW1jb0K9hhzP9gvurwfcr+
         FAlg==
X-Forwarded-Encrypted: i=1; AJvYcCWbkXY0qV2B0KSiW/q67kAGhT57cCW7UfhVuK4mYIto4tO9PKVKQky9IL+6VBuC2jarJiSmn1rRjcFG4bEy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx9Z0N1PGxbvJTipa2Raq8lNu/N5r3f9hH1RWDceP4YGce/u8g
	uKjIHJTh7xSyzqFdS14ITsmi13kFNngeOHPZCVfAJk+V8pRMMziXoOEnr2FLUVXXt2w6OOYsxFj
	tvbLZRQjwf90p6To9xzsN4bs2njLWyhVq3mDsb83/rVdOisuPCgsKwS80Y5KLW0tDo0c1
X-Gm-Gg: ASbGnctke6RwJIFyJHFFBb99cgJNzaPO9lp2WCrTu2oq9whe5NbVgjU+ru/6mc4JZC/
	tUtNxJLofRg/2IIT4+x6frFLFhJkLR4B0P6+rn9uVVrtc5WCgxpUVao9vfiIDMSCeWH0CI35ewm
	INLy8cGkvM3D+WF3Ng2jUEURDHteAFu9izD81Kw2xtx1Nr2qvKxKFyP6aKz9FZ6ce2yTGgJqd/q
	Eu1sUkzzvCv6L7p3+opdVpJWO/jCdOBaF9T0x8z9Y+svlTpoXykuQO7INdu00M2Gwt8+wLGUljY
	DbSA52KEJC+C+asn6EsCxAj9BwlsvFTRzX6jiPLWhaSDm6qP6hHNYz0lOqiZEu4dqEYpmfo9/Kb
	NuTI7jOhWkDXWh4TYNAafvua0fqNjYbtNmCA0sdT175tcSLkX7HHu
X-Received: by 2002:a05:6214:1c09:b0:70b:be30:5bba with SMTP id 6a1803df08f44-70d8903da7cmr23067946d6.50.1755778025407;
        Thu, 21 Aug 2025 05:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMRLaAQf52g8SOhUssOoQ8VlQKa8/ddrNqZK6V2qVS2jAuSOxIiK4YGo0zUtLl8zfrRNY+Dg==
X-Received: by 2002:a05:6214:1c09:b0:70b:be30:5bba with SMTP id 6a1803df08f44-70d8903da7cmr23066776d6.50.1755778023901;
        Thu, 21 Aug 2025 05:07:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a43a4a4sm31679791fa.19.2025.08.21.05.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:07:03 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:07:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_bt@quicinc.com
Subject: Re: [PATCH v6] Bluetooth: Fix SSR (SubSystem Restart) fail when
 BT_EN is pulled up by hw
Message-ID: <5upyhx73s4cru2kw6k6yvhrmwkmmh5jf4y2ymbf3famabzxxlt@26sep775vbpu>
References: <20250821115001.2690706-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821115001.2690706-1-quic_shuaz@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a70bec cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Xgb9nbmtQSVvgoRKimMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bGq3Ujx9409Ls-QqyLaliOXZC4xwW56r
X-Proofpoint-GUID: bGq3Ujx9409Ls-QqyLaliOXZC4xwW56r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8dGtL+e7hSgW
 RhZ8ys40zlCiEE/U/Zwmf4O6fCnbAAo1gLLEKZuE6heglSnbPLb/fOUe1y8zT8hjVi5H8pEGkeI
 V/tizS1gTdG105KvgLvr0kOTc1TNyl20EeRjqQotkBDb+3cUZB3VWGh/WPbaMANQJjXAp0iQtVD
 u4V5VBhzUK9+MMDKT6PCyIOaDoko0RAcCirfiEkGnvpcsg4ugsJ3ixPYUeQagE+hKL6aI87cmde
 iaXp76XM8vusFeLHhAlF9x/yzvXBNPiKfNb1ebAcntKjeddDdJ78xrafSpxw0uqQLZNr/Fs5h+r
 pY5N3TDv9duRa7slQWO9xk8nZy0fgRwcABMoZjExq6WgBN4+Ixo7vxlJ1VJasQOjJnwqGVHXIjX
 NEGCO+8lYkSbrS5/vMn+NHv8gFi4xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 07:50:01PM +0800, Shuai Zhang wrote:
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
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4e56782b0..9dc59b002 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1653,6 +1653,39 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  		skb_queue_purge(&qca->rx_memdump_q);
>  	}
>  
> +	/*
> +	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
> +	 * hardware and always stays high, driver cannot control the bt_en pin.
> +	 * As a result, during SSR (SubSystem Restart), QCA_SSR_TRIGGERED and
> +	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
> +	 * command timeout.
> +	 * Add an msleep delay to ensure controller completes the SSR process.
> +	 *
> +	 * Host will not download the firmware after SSR, controller to remain
> +	 * in the IBS_WAKE state, and the host needs to synchronize with it
> +	 *
> +	 * Since the bluetooth chip has been reset, clear the memdump state.
> +	 */
> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {

Why are you posting patches that don't even build? Which kernel version
was used for developing this patch?

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

