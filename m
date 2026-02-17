Return-Path: <linux-arm-msm+bounces-93117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLw8KDlJlGn0BwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:55:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9C14B09D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F9EE3021D06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA0332B993;
	Tue, 17 Feb 2026 10:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjpket2t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ls0r302d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D53F32ABC0
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325750; cv=none; b=GSoo4pXD30Leg7zzIi5S7utGburXmc5Pz1aHDy2x07/hjNzu5jmE/ITnM0+p+O3I7YC4TpwXxn6HfVAyExzrX7lIKWQ3il4RfLjJZDw1O48zgd8OCxPDNM1ZcVE40JvXwxWsPgdMp8XnJS06AL+828rx9NflJoyDcSuKTRmeEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325750; c=relaxed/simple;
	bh=fQkAhhQAqFJXXjDjlKJ4Pr2ZUi0r4H/CsWFdmxSGiOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrUEM1KPCGFH6VBY/v5Y6iTB+ddYEx16VuabKlLfFhbvYb3bBv4coLSnjbhXXhlVLJowCln8XHiDNvo6LUMCNEDphk7gywupwskV5Ptz1LOdllOu7Eik340Wr+lrmPToWXh0w36iNr3Xb9WqDjRGy3qsw1Wd3wygrcoVABCjKMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjpket2t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ls0r302d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAoIPe1613301
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=; b=gjpket2tJkF7Ry6c
	4Wxoow40RYWa1aGiYUPjFUiolbC8H6rqJ6xSGmY7S5fnMe6U+ZTnJOGIsre4Lxn8
	NJ/Zkz4nigFnnK1IqbRum3Org8EoX5Bc+JSHwp6ZDBEHq4udGF6ql2RZfrn6gX1i
	bjbNcshnjtxaPglb1ahI4lOIt+XidFv/rO5vdULJDlI8UfeiGDUeQTOqiSk5eT95
	3GceHAb5m4skPLqWBzmdc7yXp0H0c6+SNHNRBjEPc9uupIOQWSoRQNAwCCXKHiVo
	dS+XbCZ40Qd/pekF3d3EOjS3y1dpdk+xVfvtyWHYk0MogZ1P/TyQvEUNgVf5brjE
	wpxvgA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662t2ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:55:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so229200485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 02:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771325747; x=1771930547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=;
        b=Ls0r302dja9OozseCL0EH/6cwPwMFflYKKoH05uyw3jO6R6/2Bp1nSEdS7TDhHDPcU
         p91QaBV5o40ue1te0aqKLa6WRHj8d1lW8rYwC6PVWQvNc3gnYJg5h9g013gJjssY11od
         phO48fIHh6FltnBhLQ7hM1gHyuHnxnlC4IBmBmI/TiXAGw60HBAbUE3zt40NMhLZmPQi
         Q+zpMah2ZaEyn9qNkHwW6N3m9wmXkhC98hfJgOsI9expAf/IJXvQGgW/2KNGzOAli9VW
         kK1sHSz+IEUdWtNGQ9V5zGWmvtszkjzZ2102UWth/Di50tr+8r0hBOZrEFjhgWzNVv8z
         6Zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771325747; x=1771930547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=;
        b=qpvQpdkewY6W1w/XZ7vGsN2CAbkBSUJbCDmIaE4j+DwMsQkq+Ik+bbNGOe2d8l0m1/
         WFnnYizQN8KYXQURTL2P3cIQCNyY/i27xljv3YBsGqRinFLPSacPgA/CZd2Y8NA0eHtp
         rLwSkmoAx77QTsBYCVzNd76mROX1L/e/Bo/aadP/Nz/d2NqfIUdL4Ip3Gdy8mPOAFfQf
         b81ts0NqZ9TTsMtlNinbnx3m/Qom7Mi9vwZ8Zct1niBGes407XWnQGyfA0bd0KBQRPP9
         UeCyELCshJ3nndkS9Ts/ba9atA20Obdl/A3xuLn975SN0E1JgZqMpsiirPQASP+YO5NI
         DVKQ==
X-Gm-Message-State: AOJu0YyON5CN6DgUOP5L2ULYxqKWTLIswqZNSWE+zX3mGWAqSqOpTvkt
	CnN+weBCFs2lt4BcoaBjJDTwneVRz6sTobbk0B2SqSTlEX3hc20HrZlgUAMcAY7E5aRQ7tS8tsE
	NLX8lSdfLuXxZH1K29aI+hyASxRkDpiSWCISJUnYcSLEQxt5ZOtkPAizjaVUujcCxL6G0
X-Gm-Gg: AZuq6aL5P0Llg9e6KdwPjQMioe7cFlX/TjJmlXROlqVztbm2mxX2Ac05J5q6Ee1i/8R
	MfqMYfZQFetHgC55ZhztGVAkp5LXV7MZN5YKc8YP9+8qX2oB0xoM3EySejitjxRKrFtbFOYjf67
	+69ziqD5wIeQiPXyvNemkNycIWUnSK8IebvbsbPYPxYCfUvDfmPwdw7/LMb9sJRpdBRc7m2sh7f
	K/zTDmao3lYmd4KoJrCoN57QhFTofh40xyawZj/F/lJ6gzcqkAE5cEft1mXha6ON1iL8d7olAmp
	xHcGm5Q1HMoURJX3g9nzQ7GFzE72oUMSWX5rAQRoXA0stuUn1iJgVk5iNJBmuMMSfgJXQwDtFsc
	1TmyTajCqTAAtoh1L9v8Wcoq44LkVWhdQ6BOi8swmQfKwwNmWu5l3LGy9cudSxUG/MZQNk1+TF7
	ZV/MI=
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1324178785a.4.1771325747275;
        Tue, 17 Feb 2026 02:55:47 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1324177385a.4.1771325746709;
        Tue, 17 Feb 2026 02:55:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f129fsm2234759a12.29.2026.02.17.02.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 02:55:45 -0800 (PST)
Message-ID: <5dd7834b-2e9c-4865-af6f-c362aa0c8287@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:55:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MCBTYWx0ZWRfXyw0Hwgi98rvN
 Gce99G1RNGJY2j/5/33/UbTzDdLQQ++56CnhP5M/VN/qnH1GVLOifitjrCSbLNiACR61eZyuOib
 uyjhGlJG3UvYPuv4dna7p5wWtIKMgQMozlgkT+teo8eCg8OdEmddXBTP/3TumXoMQw6w/ZExf0p
 DRsfPyq6zSLOkcAX86DaviWLV7YuPe5q7sMbHhysOWLapVMNiyz7bzUCHryFLjDBe2rBLYSJBSS
 Rb0XzytRP1wB17VrBibsz0Pk1dQirZ6SfYkY3UW1S7nmT438sE3BE2r+0wNaEmBtgBN4/fGTO3K
 gYTytXS+FsIPIi+UEIXV/OShi4AonDtto3I8IDNfqNdlIzNSBETQNHhfbjg/m7VIc0A4MP7ED4p
 Hmul/CXNZLUafFOAPeMBRq4ordtdyHQtKVPpwmdfiA5BbXvyhatxoWKo4GwZ9SbjetAAunFR8ea
 IjtNeJMoYDOHIELVbOQ==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69944933 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=gMz6hfKilskiRDmxBycA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: W5G5jmFl2XMqctcVKNyohxH-uv5CQqv8
X-Proofpoint-ORIG-GUID: W5G5jmFl2XMqctcVKNyohxH-uv5CQqv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93117-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22C9C14B09D
X-Rspamd-Action: no action

On 1/25/26 12:30 PM, Dmitry Baryshkov wrote:
> Currently the database stores macrotile_mode in the data. However it
> can be derived from the rest of the data: it should be used for UBWC
> encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).
> 
> The ubwc_bank_spread field seems to be based on the impreside data we
> had for the MDSS and DPU programming. In some cases UBWC engine inside
> the display controller doesn't need to program it, although bank spread
> is to be enabled.
> 
> Bank swizzle is also currently stored as is, but it is almost standard
> (banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
> being Lemans (it uses only bank 3).
> 
> Add helpers returning values from the config for now. They will be
> rewritten later, in a separate series, but having the helper now
> simplifies refacroring the code later.
> 
> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index 5bdeca18d54d..f5d0e2341261 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
>  		 cfg->ubwc_dec_version == UBWC_3_0);
>  }
>  
> +static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)

Should we rename this to something like "qcom_ubwc_macrotile_mode_8ch()"?

Konrad

