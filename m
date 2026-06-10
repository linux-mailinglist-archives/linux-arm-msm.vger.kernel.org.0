Return-Path: <linux-arm-msm+bounces-112453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gFTfNVhbKWpwVgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:40:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BF76695EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:40:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JwTQYFlQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XrtUYFDA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112453-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112453-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0A9D3029D3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7D3407CCD;
	Wed, 10 Jun 2026 12:40:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72800407CCF
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:40:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095249; cv=none; b=L4/M3V6h7tYlljvbU6IcqbYv1TIkS42ze6c/BVlNOmGvmbzcGe24mLrk8AFNiED5k3lAIsdWHmP1WlW63LJqZncN4q2rXZyeXzZ/gpSSB6pJgeIT+1hqlToYPf3d9Qe0cKyViuIaTq8wVGGtC8SH6YJ9n4W3RdAr5vrnH2BlhtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095249; c=relaxed/simple;
	bh=gO3zAV6ACjX1OKk3k+a7fCPYlSW5P18LyI3qYBL1oQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kh3UXGFK1QcnfemQdNUpEySctGRhiN3JZyXreWQc16CMQMmU1NjtF0E69W+V46+4M6TXmBCczCxAFheZzYreiCfdN5JfRY8prRItBFINn8AdcsSqGcczUEkv+7+GOtzikfzBVUBZBdv10ajeMLHJKSpfGQFx6qP0pzQrdfz8nHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwTQYFlQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrtUYFDA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBdKV3763309
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HiKHG7vHKMbpSHBPFtgHyI6hMg/A287URDokAcpdX3k=; b=JwTQYFlQo5ZdSpA7
	orhyAVMks8pwz/hZk2OalXzvMgp+fkm98laHcQcZULwOlX2NJYYTwqdEDDVqlf2s
	Rg+wu8cUq955BQWV0aheei0GrgbnmeI3naKpBigj9jAoLmjEKoROgTFisV80cs4d
	Nbu+ZrjI6kr/Xt0++C/2JR3owiW8uolsyq7DO7q/fra3lt/Txfflgp+u/IqEPG9W
	kijFZCne+xIk5+qiP2zgJhWB88Mb9j/PBCFqZpknrVEb6EG86RNSoGO9cPx63/Zb
	ZSDf3VvH+FP8OrK9GqzVx3o44RDzck0ULia3UFmPFZrMdDGf0DfmkX/AP0luybis
	fWQH2A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnetf7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:40:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2cda4d0so3473422a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781095245; x=1781700045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HiKHG7vHKMbpSHBPFtgHyI6hMg/A287URDokAcpdX3k=;
        b=XrtUYFDAotRS8K45cvKdC5yH807avVx9frh/KEIZb/hEi+8Qz7X8SRKiAHnLYCaGt+
         L3yozc6LAg5mAYu7HTCfUr3cY3f91UKOb9yRMs7ZCye9npzBD62BPk68qS+PW0j5m4Bt
         rVFP1yTHohhiWIHOahy/TRVSx8nNlC8MeYE8CC+26tqZUuWam8pzQvgyBeramgUdp/kb
         Xnxv2qsevbVqyljMB4MdMv5bktug+NUqvD2URpZ7UZ46MLKqZhRwmZLP9bxTPYlOHI/I
         iTNc2a6YsTGMrP6FT10/tenihP/XklItvYh9Hgdw7OoONjt62V7kxzj0hslPsxpknAc7
         MpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781095245; x=1781700045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiKHG7vHKMbpSHBPFtgHyI6hMg/A287URDokAcpdX3k=;
        b=PmwmuBOgEKbWY1NuYrEoQu0H6XIRMCa9g2Q5idIUqJJLVaSaZXPyVLwpp/0eq5uu7v
         0hqv0Y050SBwLwh/OVkgm5Vc9pJdQ/MskBvAIZ8ge17k/NAa8gQd/Gidan5UJQKpfyB6
         nc3O1PxhDAUvyQZeyyP9i3BzgVnXfhLgOLKqgB/4p4OIuNsZMqwUd8JZ8tK7qwsUogne
         7ulv506maiAL6Gt6fvX/XdQeyuSOeaxUj0PWPpK7CHQi+D+aw/fponwrsSTeHKhRs7ud
         GfOCYei3LlZxHGNUd0bVGAmiUivo9vXO/3+LVmY7u0PgzUpRX2s4CbjsddYQHRwRyVnb
         tBAQ==
X-Gm-Message-State: AOJu0YzUQ8TcfN33YL1210jSOgQnEtB8zjRFiFuEUDCtEc9yKM+K6nQc
	O41v6z70nn62Emt87myem/cStH1/F2vaEZXaKYOQGet6qrhMdGePsugTJ2kiTHUn/Qv9zGLo2gm
	vwMeaLeLCdBX2AnFBaKX9wD9V/JkV6OFk/f+ovFl/NRmuKP8UsAS/XievFjDd7qr24oS5
X-Gm-Gg: Acq92OGYXxBOkbb6hYmYbR6SGEtCVhULCpk3Qu0+0lvvWMxcbVgMMMs22q0zQEI79Q7
	6eaC7R92kZeFfVAAqt8Vk7urb7E6ibY6PX3DlpHhc6M8SjNPdEmA8iiVb43M0EOTAeoTEZkiYQs
	Mp/sJwsa3GMhSRA0gir4Spv4f05misLjXUDiXbmtz28fnzHaBEvAFETUK9Z6pr27+TCqIn+rF7U
	PTAmpp/JRqH1i8bmq2mJTJ7ekNdQKANdJUj0ru1MdLECwF3xTMfAK81R1qOTF33mUzV+r7vOJe7
	FlFdpD1INlQVCt9/x2LI4U01AFaHks/rvw+hYIgIi5YtiOddrPHfDpnlnlHevpReZ4AcYuay8FJ
	Q9mF1W2JImokAze5ROxcGuFmOmdtIyOJ1HYgkEtIROWvnCvJjwcE8+ZqwxP6+KvUs
X-Received: by 2002:a05:6a00:21c5:b0:831:7f71:c810 with SMTP id d2e1a72fcca58-842b0f9455fmr25820826b3a.35.1781095244785;
        Wed, 10 Jun 2026 05:40:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:21c5:b0:831:7f71:c810 with SMTP id d2e1a72fcca58-842b0f9455fmr25820788b3a.35.1781095244315;
        Wed, 10 Jun 2026 05:40:44 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm25024454b3a.51.2026.06.10.05.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:40:43 -0700 (PDT)
Message-ID: <0d3e4046-42d5-4f91-be85-8681215e84b4@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 18:10:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 PATCH 1/1] bus: mhi: core: fix sys error handling latency
To: Qingtao Cao <qingtao.cao.au@gmail.com>, mani@kernel.org, kees@kernel.org
Cc: linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Qingtao Cao <qcao@digi.com>
References: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
 <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GYaO8dccCSUkA_-qQFS2viNm_xqP08n7
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a295b4d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=9g4fzgm7rQrqN3lzHvUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: GYaO8dccCSUkA_-qQFS2viNm_xqP08n7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMSBTYWx0ZWRfXziPhkLCkgF/b
 8Oe/jjeeGck4zAtbqXNWsT/yQi7pnSL8jjZazyESPX0+NGKLI9nfDK1XfHieiKsxqruRv4MZT+s
 PKnqm3YbUOmiY0o1/vtNTVTqKTXgbKaV7AoIjgTTAMt6hC0MMf3Iy7buTPG2wVk6mFEV9A7SfUT
 eH97wXPs39EUH8jV/Z3RoJkCXGi1d21iSyAEPQ5QA9wH5SIk6X0fchlr7F7qbj5jtUqoginXNot
 EusAdEt0tszEmyIQpe0W5cvAzhCicVyVChkFDlwKy3NHrbSqhmBau/Ms3j+2Sb4ajy2F8gIfSPw
 Uv5IsvlBzMeqXWcN2cfJfwF/6JnGFbdebMUqMD786ySCQF0MtEpDNX5kSp/q5KJd3EXsY8kRuEj
 cI/q76qQ2kYnvM1c1ShOSLLTqmCKL51JiRiq0psuSRtAj7JedobJ6r5W9N3cvBHtvUbcoUlNa+X
 8mb+D16lZPoRKxoV2Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112453-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:qingtao.cao.au@gmail.com,m:mani@kernel.org,m:kees@kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:quic_vpernami@quicinc.com,m:qcao@digi.com,m:qingtaocaoau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84BF76695EA



On 6/3/2026 6:36 AM, Qingtao Cao wrote:
> Bring forward the idea to fix the power down latency in
> mhi_pm_disable_transition() further to mhi_pm_sys_error_transition()
> so that the transition into system error (triggered by AT!RESET)
> won't have to return only after the timeout of up to 24 seconds
Hi, 

Generally we should not see this delay, as device is actually clearing
reset. can you give more details what is the device you are using and kernel you
are using etc.

- Krishna Chaitanya.
> Signed-off-by: Qingtao Cao <qingtao.cao.au@gmail.com>
> ---
>  drivers/bus/mhi/host/pm.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index f799503c8f36..9d29f1591a45 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -651,21 +651,13 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>  
>  	/* Trigger MHI RESET so that the device will not access host memory */
>  	if (reset_device) {
> -		u32 in_reset = -1;
> -		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
> -
>  		dev_dbg(dev, "Triggering MHI Reset in device\n");
>  		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>  
>  		/* Wait for the reset bit to be cleared by the device */
> -		ret = wait_event_timeout(mhi_cntrl->state_event,
> -					 mhi_read_reg_field(mhi_cntrl,
> -							    mhi_cntrl->regs,
> -							    MHICTRL,
> -							    MHICTRL_RESET_MASK,
> -							    &in_reset) ||
> -					!in_reset, timeout);
> -		if (!ret || in_reset) {
> +		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
> +				 MHICTRL_RESET_MASK, 0, 25000, mhi_cntrl->timeout_ms);
> +		if (ret) {
>  			dev_err(dev, "Device failed to exit MHI Reset state\n");
>  			write_lock_irq(&mhi_cntrl->pm_lock);
>  			cur_state = mhi_tryset_pm_state(mhi_cntrl,


