Return-Path: <linux-arm-msm+bounces-97456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PumIy0AtGnCfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:16:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E013282D11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A74193008090
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFFE391821;
	Fri, 13 Mar 2026 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fm4GDGgT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJ7RVREI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB452F0C74
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773404199; cv=none; b=dE4DJCwGt/Kht/xs4TGEXNitTOWlmMNgWtD2N1UoKexDMvWTWlZlr3mAwy2X6MZaZFj9YTVcFQQZFSkAk+ViSGFzguU3GAa28X1YDn/qoUnBH5lYtcU1AYGiS+jVZevpUkibix+XIoc4TIeePH123kbnTE++NEwz2rUn3SPxBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773404199; c=relaxed/simple;
	bh=xEfIqwAvCrIzypzvqBGix1qsgoiR+HtZqXThTD/h2uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZwgiGt/u6JXYy4lUWRRId1+lvueT2X1NOe8nmqbExRrdXinIThRD9iZOyA4vcjdStFbQpe/5h9UJkFiKT+iExz6swJLuLDXnE60s2+slkH0rauLQtOzbrUQbIIZmwp+n7MDjZ2l+4VtlP1fYsUSie8PO+Kj19tTbOpvGwXoyGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fm4GDGgT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJ7RVREI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8vBOv481522
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NNUJ5IqCd3Oqw2HL5xxF4SqfTaOfSP4PBNslwEEXpYU=; b=fm4GDGgToa6BwCsg
	LD53b8aNpBwPg58vBnnMM4I3WVWBL72R0fmGc6nOIijaBetaoQ0qC4O4xpmk5JYu
	He8F/9eCAiO9sPgMDYGRgMIQ8UZ8USgiYz9pG7OHY/S4sX92GqLYnkJQDoJaPiBT
	ZSdkWxiEa7xqOCNUoNpM2Fp0f8LYm+k10WA8vBiCP2eQWb/ugT2qI2oBfdX5sHTH
	O+24EZGo0KLtbbAHBn+1+JIM+VTiKsLINsoG6ov6akxgVLH5beQsJhAX/GaIQQsf
	/g8gRyTa41lcJwtnLOXUoB+H+diHMKR23HFif4B9FNPQmcFXf4wuyWfu5/NMUVsC
	9cNndw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rn14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:16:36 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d7510702e6so19173438a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773404196; x=1774008996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NNUJ5IqCd3Oqw2HL5xxF4SqfTaOfSP4PBNslwEEXpYU=;
        b=jJ7RVREItRU7hV4o/O11BP8sRP9aELG8qgVn8JigFhBKCwcIX4/x/QuP+hCAO6B41p
         Hd7JXCJanJMogrCj/zzFSOKxQYaxjSHusf1SuMvg5baxsWhVtUwgr8HE8nx5SmiWe3+S
         B8il6TJScEkoJKpZUQKDbYYSpXwnuVKVPO1hU0yDbA1DAS6mbrydOaA+kLQiPA0kpcoM
         Xr0ZbacyuWbp8rauntCbo3+FhPJ19R1lV/S0xhdR2ImZ53bKtyBtaAEe/0+MMe7KDj4x
         jBXmo21/4Uitj0lE+4p0ttwQrXxeexxzUyQzFrtbhR8PtFVdV/fAfvYG3f5FG+MHq27Z
         nyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773404196; x=1774008996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNUJ5IqCd3Oqw2HL5xxF4SqfTaOfSP4PBNslwEEXpYU=;
        b=tUvw2pZ/1T5bRu0xIARVDBpEFxzsdZEYTu1hCTWDVuDpE6/IYAoj8SPh7b8TupqnOS
         sSFnqmSJJscX5c5JhoVAAz091tZUEvs8vswWA7GmO4TuNdFJs1KI0f02S4+l7RjfXh7c
         okYAEwGpD0ZMs2h3jlO0fvag2zlMg06rtZRnsL/0TPaK4MVqecn4ZaRfoBXgfVR3ELOf
         fsvgXgoTu1Ksz7zLpiu/vFM0WkDerlNY+uJy14hH4f22Q8x6eAAhO4QGL17kGOBgfq+n
         Bryv0AwXKHVpISijwcVpRCpfM1/WTvwJVMwNqvX9IgETLfOs50dUAc3tUdIO//SgMR1n
         7Akw==
X-Forwarded-Encrypted: i=1; AJvYcCUZI7g8UMkxVjSDZXQE/hKcQHCSy8duzaFMd/cCrk/yn5W58pNoqgxvxGVy6xJq5gX62jIeaz7WI1aIr2yO@vger.kernel.org
X-Gm-Message-State: AOJu0YwSAJeTQUtILgRUjGgVSb9zgViqxRlvamyDqFuqCyUgcwEMIrBK
	xu5LuAuxs2EEyrE6qthyPhBNPuT7Cjuh1QkZQHqgc1LUuEAtCPVXhykt1URDXPtKImh5a/6Hb7s
	aPtof+YcfFSVT6h72Q1lmDOSLkN/MHVK73G0qkv1GG4nburCsJ0CYhTJNTp87M3iIgFw8
X-Gm-Gg: ATEYQzwN3y8q+DMUBPDinWpDsAiGgVuBHKnZU/ZADs/LeStJWuhzjKuWcAoxznx1tET
	VlBqUAu4Cqn+pHkeXSV00uNuA7qKxxeWYdbvT/GudPPkc3OWR+taq27q2wM/0IMUomcumgjtUnQ
	WRku4E/cNhv+ZISJuvT6oOkoVmT3A9/rWllIW4mN1Uw6WppOOe9qU8TLhsdTArihqU+JPtnr+rF
	+ZAHDTQO+ovFNGmD6JPz7FVK3Z0zt7CLIB/qBWj3/C+h+niKTv+nxAwdS0N5oHshy257NhcIc4t
	zb72e7lN058uNXBKqw83fQd+5v1BNPgQGtZzYjHC00PWEaJNrQwnY7o3nnw0fDQQkm0bCjKfxqm
	a6cP+P8z2I8A0AbHi1/rH5K/bpQQ5oOcGT96FBb/n9tG8D8A=
X-Received: by 2002:a05:6830:710f:b0:7d7:57c4:365e with SMTP id 46e09a7af769-7d78251bf42mr2068130a34.18.1773404196337;
        Fri, 13 Mar 2026 05:16:36 -0700 (PDT)
X-Received: by 2002:a05:6830:710f:b0:7d7:57c4:365e with SMTP id 46e09a7af769-7d78251bf42mr2068106a34.18.1773404195995;
        Fri, 13 Mar 2026 05:16:35 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ac8975csm6132745a34.8.2026.03.13.05.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:16:35 -0700 (PDT)
Message-ID: <61eea507-1cdc-45f2-b688-a4719e79107e@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 20:16:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btusb: Allow firmware re-download when
 version matches
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j1Y9vE1PUWZVXVcXuCdXYFt3N7yuyKGn
X-Proofpoint-GUID: j1Y9vE1PUWZVXVcXuCdXYFt3N7yuyKGn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NyBTYWx0ZWRfX/Cx07LMr9olc
 8RX+2d3Oz4NVyICqB7Msv7k9s2AL8xzwecMaT3QLyXAC+TuuxQbvmB1MrJKZCamQX/2HVYTZCEN
 RqSncSNflfZ5/H0q3HzuAvthloOm88LUebIh+HVa1gv9j7d8fFolyr790qLUpbzwQJc9DqdzXIs
 Kq2PhPEy6NGkpU6NOa4nmjtFB0rOqAHiXP+CttFdTy6lq/hUmy9mGNw4IAWuH76yLusM38knUz3
 d0gSoRX3a2Cb2SULxivmMyw1yVDBIF60J6B/qw+NRpxKOLGpAOk1kTmGHjTq0AEHwBu+nrWU/fU
 vD/J+wNXHb4n2f8IdP4vU08sSiWkpwfDiDWIyD6dJNCQ/24+Fh0stRCl0H1Wwkttn+5mQkxj8yf
 qN3PCl0AXwa5o3Yt1rZAQigIYMikA0Nd0rlFAtVqI48toKm0shx160J2xNN40ry6QE69NEqgMvM
 SnVDHIBEAekGo0YgHhQ==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b40024 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XLcW7MSiMK0kOx3OsRAA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97456-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E013282D11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi reviewer,

On 1/8/2026 3:43 PM, Shuai Zhang wrote:
> Since USB can disconnect at any time, if it disconnects during
> the BT firmware download, the BT controller firmware version may still
> be updated even without completing the download.
>
> When USB reconnects, the BT host detects the same version as in the
> firmware file, which prevents the firmware from being downloaded again.
>
> Therefore, remove the equality check to ensure that after
> USB reconnection, the BT host can still download the firmware.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>   drivers/bluetooth/btusb.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 646de80c7..991064a25 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3503,7 +3503,10 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>   		    "firmware rome 0x%x build 0x%x",
>   		    rver_rom, rver_patch, ver_rom, ver_patch);
>   
> -	if (rver_rom != ver_rom || rver_patch <= ver_patch) {
> +	/* Allow rampatch if version is greater than or equal to firmware version.
> +	 * Equal versions are acceptable for re-flashing or recovery scenarios.
> +	 */
> +	if (rver_rom != ver_rom || rver_patch < ver_patch) {
>   		bt_dev_err(hdev, "rampatch file version did not match with firmware");
>   		err = -EINVAL;
>   		goto done;

If there are any updates, please let me know.

Thanks,
Shuai


