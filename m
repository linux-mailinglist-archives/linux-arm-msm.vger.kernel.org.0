Return-Path: <linux-arm-msm+bounces-98208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPoZMV9ruWmvEQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:55:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C91CB2AC702
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24897310B805
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB24B3C1996;
	Tue, 17 Mar 2026 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2V3cC5s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TovRS2zH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED033C2788
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758610; cv=none; b=AVLucfFVgmO2KZHo1rxoOmy+Ym9T3KNnDvf7KTJ6YHWXjHTqjdtcaA/KyQ7mTwN8wp2gRGLmTnRSamLT9LBzyVumhUP5BQqIYGz/lvRsSHfNVAfUIlejYcuM4mgUtzWulLLHoJQjiqZkMTTWraFzyV093kt9fCF1WUFrHN47ftA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758610; c=relaxed/simple;
	bh=oQCZCLce3xpaGWlezyE8g5uhvTgez1kW5zOG+QuIWzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irhEt/96FTJPQs0RteJMdJ2V6X3CxJJyMTpOP4qs4JqCq6vshoWWB5P5Pa6G893m9RKvqweCqPuWsvKc+Pccu6bhu2Y+6Ff0JXF2iXj4GWYzEw78hunfnVD+QTNmru58JEUhzlw3nKCSDfMOLQlFQpoe9bA5hAczSBK4jUpK3F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2V3cC5s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TovRS2zH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HBlud81026609
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EWo8g1F9R6dgFiJL7sckQS/g
	QdPTwSR4iwuVXJ/FiLU=; b=D2V3cC5seorXPvYHoJCeivF5K2F0n51drOCCzrRa
	JcFCXMSyCeEbAoOWybt+SQ5B2C9xn4/78L8qvXBqmwdKYHtgjKAly4uQ0p3wfZki
	NbSXetyHvobnzIEofaO8wThfrZjC7s9nvMc6QbenJvQdUMpDpsCcZ1IUJgqLdQ/F
	kvRD/5wRBigh2VKxuICVQEQQ+QF9kkKx3jhT/Q+Txbk0Awt3k6x9n4ODF01xqEHN
	3OeNwzJpEjNFbl0IpuCVsV1vzRlzQVOvLt19uzvMSeKmmniDmjnHYPRrj5GUZV4C
	RUWtnNW3wuks0EG8lgKL33MGC1Y6F8AzpgNyGYdhrx20EQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy6d6gm3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:43:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917996cfaso26960561cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773758608; x=1774363408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWo8g1F9R6dgFiJL7sckQS/gQdPTwSR4iwuVXJ/FiLU=;
        b=TovRS2zHlgVGnMKJ+Mn8eF+QptEoVgfH92xgjVhx5T/wUbjormkbIrymu672aepwAn
         dSbk9jLWm9H3cD5HaWWiTkwa9+Ln/WJsKAUz69LHbvTN/H61w/hqvHSG/DEyg5ysmp+w
         4DQb6aspvyTh75aDAiojijxgVHJGkhpWcT7UU5T275iqf9IcCeb+PSCot3TOAQIu6tdR
         t2jHjdyWGV6Q1/ZaE40c+N5vXaiclPIWKS+PCM5vpJ1y8tBUz0jwtudVC9TjGuDnd+OF
         IAALzUKe+EeMmmTG0qBjcm8r5p12IToLarewdHAolQTXv8HA7Ljep2R2paAgdhvhCtm2
         4ubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758608; x=1774363408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWo8g1F9R6dgFiJL7sckQS/gQdPTwSR4iwuVXJ/FiLU=;
        b=nZ4IOXSMTr/S5YvaWXSiSEVOEj9FWNh/sawQvr3Kv5gDoI7QBbKagIREBhZ2GuuHoS
         7fzQlbvTMVpxnIfscQCJ/bK1WitkbGlCEXue+OCkbL6KPU7NPNdZ4mXvbTQfh8mJ1qNk
         lTYOVAQrWPPxnLiIWcWAlIJGjel0a5sQJJTJu9m14IhvgDUXmffiXg+4ub9tYRuBoW2V
         sUhuqisIJVv3rqXWmgl+3XaYC8P8PKp/qTcsNNu0RNDcYw5JRrDahRJCE0cZWeK7TBG9
         5I3/RAeGmrfCdYOtBLAyuVnOas4k/x5f72BSv0txfai7plmdBGCQzKEGGyUJO4UU7Ym8
         6GfA==
X-Forwarded-Encrypted: i=1; AJvYcCWaglllUrOyplco+kf9WYtemJ7CisEDSRMI/O+3NY/rV7paFcYaWwHPhkkrNDEKhD1l1cYaFrBl9wbQUwj2@vger.kernel.org
X-Gm-Message-State: AOJu0YwbNQbzYRz2Zut2CXiOWiCAqsbxVm/bIwlYkNVdtefKEPtz93De
	L6FpE17rJlA8eZ8eb9jn7fMeEfvv47q+MWB0OciZBtpid1x3Dj+lRPLmopa1qva8gwMe+w5trsA
	rcSdRBLzB5ucdtqTJs0uYk0mfo8ZAzeEIXlaD+mnTQwLpPMx+yiApwavyOHkEglr2thkbvtet+9
	QV
X-Gm-Gg: ATEYQzzRrgiX0zFNixFZ60L0OYeu334LlkkQjovwAisrN6MBg7KEcVwCrAp1KQNh3Yl
	v/6TZ77LWZ19KjzhCxWiA+DpMSNYaZdufCxtDqdxI5UmxIuEaOvyTivMpvZHaNjDb75K9pPSV5G
	UAknUyO6A3w6noaA+86GXrl8Q3dDlaS3xxMJqPWMb89sRGxQrHuruz6e4owbxETgS4Qr4Tl8DU+
	6/wYgCoiJxl8Xog99zB65oVWj5xVPQ7/CZgImqBEjGuCBYDPun8J5CD0ekL0h/vL5qrxA5UcFVF
	95X5sxB6uFF09MjnOhNNg5z1fFImW7xzU2lDL5uWCHmkUsC2/VxS1P0RQuMu3Zzguto5KQH0jbm
	FL4vaJq0rd9Zcl+UCKy2SU8uqbk/wSWSPL1Vg5EahmujSdDklXPtaxuxltTBNoh9tqIq5+MGMwf
	GeS2gkcXmuiXCCsbyfaAQ215bBom/a41AV0Yg=
X-Received: by 2002:ac8:57ca:0:b0:509:217e:a535 with SMTP id d75a77b69052e-50957d09757mr212121011cf.33.1773758607631;
        Tue, 17 Mar 2026 07:43:27 -0700 (PDT)
X-Received: by 2002:ac8:57ca:0:b0:509:217e:a535 with SMTP id d75a77b69052e-50957d09757mr212120431cf.33.1773758606863;
        Tue, 17 Mar 2026 07:43:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5f33bsm39759231fa.27.2026.03.17.07.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:43:25 -0700 (PDT)
Date: Tue, 17 Mar 2026 16:43:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT
 transition
Message-ID: <wdpkh3s25t2duxf2csppj7baqram3txclmv7u3aymzw5prk54z@6lcxc54hwduh>
References: <20260317-topic-tbt_pg_fixup-v1-1-325b8647bc82@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-topic-tbt_pg_fixup-v1-1-325b8647bc82@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMCBTYWx0ZWRfX2H97+BBQN5q6
 PjitZ/BdgfKAyhbSSF1Ak5ygEQa3MuD8FNUDStVo0dcA11UMfv50n9k87gnYHJouCtsl+HKEGeF
 6StNc1wp1OzRB6EaxXJ1sErNMK3t20UBk1vuJPdweCRPvQ/Po8Ai/tg+SrYDPwtA40L4CciCAXO
 vtTMylA1hfWlT6n7+ZSvlBc67Afugf2bZHymGt7iTu76EmIe/ZBoCUvZ3CuKdI+NXSPWjL76J8p
 6XsJKoA9p5J/0Vj6pIpIH4xfyKDqPc1qHFAzM6fL3oeRkSQ0XIDN0Qz0kzRTg6vXP3pzdneeYs5
 Iy5RpdfDQQp07nTsW1h24I6clbBXRfMvcSuO73NB+uJf4FmLc0ffj51Ic0G4Y16U1BEY2GNBkck
 LraaCEl3I5aCN46GvYmBVaIggUfpyf+3fj7cAAB89qqn7n+kJXsHw4Pfy44fTm3Jg7s6cCqwIGu
 Y9OkK59EAuiNyE80VwA==
X-Proofpoint-GUID: FUssjhotoVCp3QFMhYGx1hvVhcEFBxrS
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69b96890 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=XWy9zdsJDK_KbqaLYLgA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: FUssjhotoVCp3QFMhYGx1hvVhcEFBxrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170130
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98208-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C91CB2AC702
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 03:14:40PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Similar to the case of commit d48708500610 ("soc: qcom:
> pmic_glink_altmode: Fix SVID=DP && unconnected edge case"), leaving the
> TBT altmode makes pmic_glink_altmode report a SVID=TBT && mux_ctrl=0
> message.
> 
> Said commit reordered the check such that the SVID is processed before
> checking for NO_CONN. Rework this to take into account valid values of
> mux_ctrl first and hopefully solve this for good..
> 
> Fixes: d48708500610 ("soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected edge case")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink_altmode.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

