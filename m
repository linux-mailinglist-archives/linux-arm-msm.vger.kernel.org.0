Return-Path: <linux-arm-msm+bounces-109342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB2XB0trEGoTXQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:42:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 732415B6613
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 988953084AC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B328407CD9;
	Fri, 22 May 2026 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFYDhm+Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKUd6vLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9E9421F16
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459591; cv=none; b=avCbuvdcYjXU1da6BcLruxRSPsLkiD+B/wzgatfYpBHfUgJ1TINu+Hedlp2dUjpVkCmSoeI8tJzxtHPL0ZS0ssABMFAO1pYANkuZ0boUbJNgX1XNBkBaGMDDfH3sERI9vl/aw05wA1R7jsqwAclMF1D3h1pZuvVkeR82wUkQCFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459591; c=relaxed/simple;
	bh=nlhwD1TnjFIKn4FnqEWgsp8KPK7T74oQB93SFxPxztQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dO6ue1O26mZdqX2J5mXdBfLr8dp4XpK+8I5LgxT3cqDC7ConVS9oeD5qQ1gW6RahwI6lrv1nyPA5eguExMseW9ajaDRTF0EYmbVserDrZj6Wouj7OMFRigeZSJzNPv1V4Y8w4Sw121kQ4V/fzHaFT1pkKN01qj4ePR14bik5Trw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFYDhm+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKUd6vLm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4Ap23947413
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QALT+lqGX8YNkBTxqKWDpjn0
	E/tfJGp0u5h8Wo7ogaY=; b=kFYDhm+YQ8496HKUBCdSCdCELD08GwsG0wphx8rh
	JXSRpeOmhDPAWRJ76er3d7HH0UYQjx/5raL3oCQVPqGt7MiRmIYZi50sBDPDsSpW
	sTqQnP/vlYqfDJwq54lEH/X/+DC351UImNbyrrHrpAzBgaiYZsfZs+XHA72PyBHi
	SZMx6GiIQPutweRhiRK0O46epBEjjMvCGW6zsfyV+x1a+2mnp3MoPg/Is7CUcUdD
	Q0AZXJm1mnH3emG0Bk3wTOGRiXZ68LxrYlzNQs1EWpKIwLaamgUw8N6YRfbyWJKq
	VxSHYtVhtC1vs4FYUu+mtAlu7rV1SrDn1vduvfixq9NP9w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngv4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:19:43 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fcbf9c0e8so12080519241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779459583; x=1780064383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QALT+lqGX8YNkBTxqKWDpjn0E/tfJGp0u5h8Wo7ogaY=;
        b=MKUd6vLmwTWyyAB50bTAXsKy2GC9x7qrnt3vV8JHxrSvMuGAnbwrNIEVkQKyAdAQGG
         yhJwMTJHVmN3gqop1OlOc3jCj998EHDJBhJ65yaRjdYZ6DLdOKRIqT1VR0jSMh8lROlc
         ShvVBj99P0eXs/s2XzTRbSyvF3VtKjyMbopqsvksqyEQgDpGg7JFILJOU+j5cas04LJo
         dGZAoyKelNwVvv1COyyWX3nw0cvSO3jfyFyq+/eWmz/pW+hIn7POBVMt9zkn4W/lwKL8
         8l/G8Eq+OlkrvrEAVbb3HR4vANc3IJwOPd1uaLWlo/bsx9ul9d3aYD7ql9O9JkRuOwSJ
         fwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459583; x=1780064383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QALT+lqGX8YNkBTxqKWDpjn0E/tfJGp0u5h8Wo7ogaY=;
        b=kXwAyweSGDjDln5UuC9/4WpYNbTEGwswUFGnVeBzPcIztV6ev1pWoAloSMf0oPiuuu
         S7yNStiBjZ69lXOkWFQreOJ2uASHf8kgidLm2WO4gS3jBZ72321phKrUnyafAN4C7Smi
         fPbV2J/E6ZxfXx8wDqyl95YH9WTt5i1XJBjMhjdVr0GpQ/swNSkcZmsd5Sp62QpcOKs/
         pAM6yn7Q3xkviHqvTTx3Gm/O5mh6OCHHLzxxuA9TWEeTkkpVvwK5qE8wUAY96F0EnOh2
         gebq6lyXvjTlVFLWNmEyCCgJB9EpYyUe5s2fCw5MVuwOdDAz2uUM7sOD3MDbBgaxTC9j
         NNBA==
X-Forwarded-Encrypted: i=1; AFNElJ9i83UlcV4K8kRKT35gioxL1QjBwJf/su/LJFngdhTpU5atPXkd7aCa+PSyUgPK9yKNzsBZz9Ltd55Nop8t@vger.kernel.org
X-Gm-Message-State: AOJu0YycO1hNYk1+ZR5lSd7Wz2TWfB90gBiqpEp/jLSNt8/E0TOxQZgY
	UvvdXuWVarKXZYAacb69zXqAqDYeEyWiBrWxt+1iqVuq2kMXHpPwSKbMtWnenmZVnFLtEgtKD4s
	d4b7X48QhKhJ7qlg4DDPOwwU4eWlrhZZ73ifK/7wMuln7fXsaOa6F2sZj11xACxyCxi2b
X-Gm-Gg: Acq92OGN5o/TGSRKkbxmupTqhn4UDmHDQ42j2j9v69M/cd3akh24Tr1t4u5hiP6mC2E
	QGpCa6gDDJK8beSgb3ZFPDs2YdGCEFkDmoJXRp8hiavHodnanNF5hpSM6TBwedb1rAZndduWc9+
	aoZs8Ie3gnPsl2mCStbWAH5X4nuJ/wR0jjQNkuagmDJQHkIcpS73Ao5WARN8ybnJQQh7dMbDlgJ
	BjPaSt1kvwy5XteiWGHraO0a0d4x7ZrY2pdPZdFcOF0Qo5UNpqGlljjtam1lffAH0VyXxvZZiYa
	peIgOwqxZ/rL6yQgUov6BUQNfKYBUOiRptxMHiTVFf++RgBBaMuDTw2YHXAk+1pg8KHoyum8ieR
	9NaPq7VuRRy09tv27LevGwg9xDgcCKGpoGXX4d+eVAkDby2F6/ZeV04eWlNGE95Rr7hNB62qV2C
	Cmk1u4w3M+uVtxf3JSSctWpAc/euoebbIDfV0=
X-Received: by 2002:a05:6102:504f:b0:632:d8d5:2908 with SMTP id ada2fe7eead31-67c8b3aa864mr1915560137.26.1779459582747;
        Fri, 22 May 2026 07:19:42 -0700 (PDT)
X-Received: by 2002:a05:6102:504f:b0:632:d8d5:2908 with SMTP id ada2fe7eead31-67c8b3aa864mr1915528137.26.1779459582386;
        Fri, 22 May 2026 07:19:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca74c88sm3715591fa.12.2026.05.22.07.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:19:41 -0700 (PDT)
Date: Fri, 22 May 2026 17:19:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        stable@vger.kernel.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Increase SSR delay for rampatch
 and NVM loading
Message-ID: <jbpujugiw4gbgx3hxnseop6q3w2zvqigqd6pcdg4shdnyy37it@6ytmgq7jejhp>
References: <20260522110838.1158643-1-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522110838.1158643-1-shuai.zhang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a1065ff cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qPZ7hrfojItUN558QmcA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: zYdf460shEA7cBeaGB8pjp4fR4vLmHRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0MiBTYWx0ZWRfX2/MxRkwyRzjl
 HJVWfIfRQZTlpk7Yl1eGe2HOW4avftav8KHQeVvjVB09dDeD2p0N1YUHqHhgqXpKdNfOxgoSxdt
 wg5gUHQ5eDsj1Tbrt7SxlcMBsqoeHT8hsf7R7dldbsr6UKAJxkvhOwG4B0870YONMqV/QDnMbdv
 j9uvrRcF6Q4kgly4q/Wl+NcGUB2LlssNVIsdYMUbmchgogR6wUM5dCG+3/zxHT0xPHBlc1iAYXt
 A1s8Skg9CoQ+Hj/HdP0vHGxv19Qmk6+oQ4xxyOwqfV2jWHXp3D0ANWMkCZYw9f9FMM8jRKKg59q
 nTMUhQ9b4OKekF1A4nEFVly64ApJzGgNqnB7AQJdmx36f+lmSGeC6aAZ++qnOj9KtCuZhrYgnf9
 prAF380UnVl6xFRoLPxxtf828ncmUu1505HWuTKEdRiNoA9ROdJZTFpa8kaWecJI407fWWenldh
 MXOGBKjhKJEUu+siBFA==
X-Proofpoint-ORIG-GUID: zYdf460shEA7cBeaGB8pjp4fR4vLmHRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220142
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109342-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 732415B6613
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 07:08:38PM +0800, Shuai Zhang wrote:
> When bt_en is pulled high by hardware, the host does not re-download
> the firmware after SSR. The controller loads the rampatch and NVM
> internally.
> 
> On HMT chip, due to the large firmware file size, the
> loading process takes approximately 70ms. The previous 50ms delay is
> too short, causing the controller to not respond to the reset command
> sent by the host, which leads to BT initialization failure.
> 
> Increase the delay to 100ms to ensure the controller has finished
> loading the firmware before the host sends commands.
> 
> Steps to reproduce:
> 1. Trigger SSR and wait for SSR to complete:
>    hcitool cmd 0x3f 0c 26
> 2. Run "bluetoothctl power on" and observe that BT fails to start.
> 
> Fixes: fce1a9244a0f ("Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

