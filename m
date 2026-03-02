Return-Path: <linux-arm-msm+bounces-94835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G1HMiFipWmx+wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:10:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD201D61B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E35103077214
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CE9335067;
	Mon,  2 Mar 2026 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8p4kcTv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zs2Gd9+H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF7929D29F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445890; cv=none; b=LbgekLDHArM3TH6nso4vK0RztGijX21BROMKoX+XrAIm+tDpGakFmT81Mc2RVfO7mxNOUorEEc1Pph19MKAIwr+35nDV7YMaIDDGWJesx9H51uBA62jrgoEKP5aBMEbwhQR/ITtTUyzgEdk9hnFZe6q0dOihUGraE5tnbxJQ9DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445890; c=relaxed/simple;
	bh=wXIgrme5afP2tiMPRUXViQHOv3sFXATlQlG1saolHO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6QC9jkWfI0koZGg38PLYzODBRGHV2ap9T7FuyB8kT15HsELRz9x2PueQzMyhADYHhNPKCk/hE2LSNJ1TgeWW1f79TjYRz6SoCq85X++7iXdJMUOkyz9rDPXdGGxdCzpWmvfaMu31biMtKSFwwB7mb3TLBPP2oISKe8aQRTH8sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8p4kcTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zs2Gd9+H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228HHNN3223969
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bLYBII5W18wW9AhZIsmUyhpOT4qZ8+Z211ODoWRcDqE=; b=R8p4kcTvjlTzyJ44
	szYg/DEpj6MMXEUMbiiN1pw2tYaxyumwEz8Irng5sZkf93YG/J+Bh4F4bwKcnOPE
	WaCdRdZpN0YYXWXnt/TXE6X6oxGC+0J5r5rb3SLXAoQgOKzmEbWyiH2HeyzkQqNK
	chg4Ch5VtWbJW6bmhqxv3HjiTFDGQQKJX8vWxBpumSett2CL4ccNOVbin0f9Vzky
	QkGGK0AL+S12hU1mQ+AVAMo3xNRxB6P/pkX+C6pcud7yTcGpH0f6suxNcX6D01b9
	ZAxmUx5KFn7C18GoZ1M7RrVaztkr1FTLpyHJYl/UTrjn67B0o7IG3qUB1wTFDHV5
	588phw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1hpau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:04:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50fb0abdso438161985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772445888; x=1773050688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLYBII5W18wW9AhZIsmUyhpOT4qZ8+Z211ODoWRcDqE=;
        b=Zs2Gd9+HRpDg0sEfdGcipIofpvFtCth9SVkeD3AVvQCxxE1S5mlWKnhap8TQlKqjcj
         h0c2cj7K+O5OGPSfx6XfAYjBU48BahppvdYvFs8HBvtOi4PlttOJvrBxl0qjyHcScX5z
         /Z1XtrN0w0j9tSTVDIYAT5OxCu1x0by1iMBeKzylI6UBJ4ggXDcGqpOuDZ8XuoEph40t
         iDVSMmhrYgIE1Ng+xUUEjl1mXFZMI5Cm28+SVdyauxh2GiTViBiIAyJnSiHJInKykWNE
         r0eW8f/43IZPwm404jyb0YwHJCqYE0LJXfswJlrt3FPQc3l//rN1tA/1DOvfPdMeaFm/
         zYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445888; x=1773050688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLYBII5W18wW9AhZIsmUyhpOT4qZ8+Z211ODoWRcDqE=;
        b=SH3+VVDgwGui9nP26lfEIBcpxcGaQJQBv2k+/jc5WuEuH3lj7BUsATTAafiM5wIcI2
         y4N4m9RJWHBV67VlmvkQT3cB91Y0QuNWBWgzNIyJm1TIhUB2uFgYu0YWiFx6OVFote0D
         mi3TfQnqnDODgUBYP3+ewpsZ+ebWn8wBBBpr4zCxmNz9CfSv9IPXuQg5EUxUODnGxhHa
         Xy135qC8PRmtgv6pT4LXIlJleIf4nEStWQaiE0iNmMy+Mmggo0RrzN+GY6nXTcpSbdGD
         eM1pAbejtGXp3FGbdSXSZMAxo6tBP4u7Y72mJ4aVShe1hKc9mgm/PvONJ5NoymyBYUxi
         Yp6w==
X-Forwarded-Encrypted: i=1; AJvYcCXpkk5RIpn3DI2Yw6y45u9VlHAJvkKRo9A73mWHpLPd0QosApEkyWCffkF+XHdTecifHcrCWEqh37mO2uN4@vger.kernel.org
X-Gm-Message-State: AOJu0YwBASFqfx0PnwI+4n8HvCRMZ03ZBtatm2aCQYHbvYQUVycHhe9M
	oCWxTf2qNnDgQo2HyYryZRffgAu/nW7AKoY3hVrZsKhrjAUD1/zQOb0xQixpHobE9DuChkR2OSy
	/pGWSdBLz+l+Pht2ZfdC0efGZnIWOTCGqvLlUdohMzjl7rpjQ616jGYz9jW1L5yKvQBQr
X-Gm-Gg: ATEYQzzbrBSAORL6yD0foADQAxkBvBrAna7CcDfLV727+olP29JEs5ieKxR4c2Ydr9R
	g35zp0jiaTTZ20032IaFpbyJHvaHtPCIlL4jMohpe9bDsdNV3uWndBbxPS8IZrdUs45Slr/ngqA
	ROQ/6N1DQvwiG0VArP9WEtIbYI8HSBn7a2Gx70Gi3q2g3ESRY8lUyj0AClDJ68Rh0LAW3R5dfTn
	73IgimNH0y5davDZ1hD4YFUTXU9oEzMkQ92a+Xt7cqL7vXP1FgDB6MttsAJjPQZMgyEj06hFEAV
	m0qOtWikrCKygMUqIyODJTurpQ0b91QFLFqBT85MnH6ptzjpNYjK73cfRjaM4fTc4/dimRC6Ml7
	aA9e4ArqtveO9Z3bKCjZyiXDC9xadFBFLu7VKOXdwLXRJ2wgiU/p81WD/2iw9o4cXY9H6IifkZP
	YRwNA=
X-Received: by 2002:a05:620a:199c:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cbc8e6b61cmr1015329585a.8.1772445887892;
        Mon, 02 Mar 2026 02:04:47 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cbc8e6b61cmr1015327585a.8.1772445887456;
        Mon, 02 Mar 2026 02:04:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae6131fsm447236066b.40.2026.03.02.02.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:04:46 -0800 (PST)
Message-ID: <ab0762db-c804-4651-9bd5-8675fe164ed3@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 11:04:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] media: qcom: iris: handle HFI params directly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-3-acf036a3c84c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-3-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iRVxlOLh_HrbELVEeK4OQp1EZzhy534p
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a560c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=v-HoNxYEqgd66x2SWJoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: iRVxlOLh_HrbELVEeK4OQp1EZzhy534p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NCBTYWx0ZWRfX90l6wXPGWvOt
 fd1hbxCtWRgmUHTml7TdfqheUe5HBz6IdwWyBh7ImWLxBjXa5wEa/GOkln9uvYTUhWiv3Iss8ro
 pooCJ1rzpAsgSDCiRdte8LYBi8ANkHtgwEg3ANrEJE8/+l6QCS6sQt3U5Vf616mYkm5l9oANLRh
 Ze8dho/W3bh6SyQbDtmPpTAk+nGJ2+ZJXbxQI/KrKUJK5su7L/QHIt8XqvcvDM1KPatxXmmr4jV
 aUpCINR0dXw58NfYrrEQuIZGgAXmvSF3bS1aspoNGSpb6TqYcWlbSibLarPzOqVEQC3W1Ux2JsJ
 5AJ5piK28uDJi7JXAqVd0SBA6kG7BEa1nqOkc3A90htAyl+9Of5pGAE5JvH0mUiOBXGzA96u9UZ
 hkK/eJqPcg3WLzlNGHolO5wTO/JZYrvXGtFNzM1BKI+vGfNa5hLtpTZZuYxNTgIRq2ME8P1bXM3
 jKu1hSC3xB4vyOuog/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94835-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DD201D61B3
X-Rspamd-Action: no action

On 2/28/26 4:26 PM, Dmitry Baryshkov wrote:
> The HFI params are set per the HFI generation, they don't change between
> different platforms with the same HFI interface.

Looking at venus/hfi_cmds.c I wouldn't be so sure..

e.g.

case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
case HFI_PROPERTY_PARAM_VENC_SESSION_QP:
case HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE:
	/* not implemented on Venus 4xx */
	return -ENOTSUPP;

Konrad

