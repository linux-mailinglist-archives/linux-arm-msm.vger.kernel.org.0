Return-Path: <linux-arm-msm+bounces-94865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKNwAcJrpWk4AgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:51:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0821D6DAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E00D30071E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D2733DEE0;
	Mon,  2 Mar 2026 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IV7mNZx8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGoezZ3L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B685356A12
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448697; cv=none; b=TqgUCBCL5+XT7MhuGVvDAL0rtz7nyLchBT3edEjw4jV4YvKJjMK1ptmzIgpsh1EIlc91Aoa3g3+cfP9ByO5S+HodBWMWeNixfI2vWXC/oaSekU19DM/It2Rj/Nm9AB1acIjv7vsCsdDF69KItVO7i10vcTSPg2sD4rtRsnhfAW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448697; c=relaxed/simple;
	bh=YbNlWU+LXhiLPh5IlWgzvOAEn7YydIRKlxSLyxLijnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djT/T227InkOmIWyxk81IbV6QAcMZAow5BinyrixCHl96GS7NJjaU+14IN50RWBwokpa90fMf56liSCoxVClVj6EH2GTSFh7OJSEImynjI68y9zoE6pHubjxX5pa4vXc0CU8T9hAKFEk5onD9TxZVqHy3+bal+xQYNEzzucFR8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IV7mNZx8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGoezZ3L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62281pWf2624089
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMdp7LO8XhUCSDsvFwoC4/b9hnTA/D9rEddSM6zJVvs=; b=IV7mNZx8ZwPpAmEQ
	KZs1C0/AD815DphLF2Dh7vF8sAHMuATbAuVvMJ+KycMgH2BOxzUKgPDKWtZ4nQrg
	+YbZmMk0b2jfDh25pJkvrkiOo7HZUcMKpZvqD8v8Xz1X7fnSGZ7TW79K9WMPdKLH
	tsLzbUF36cjfotbi+WPAWOXqBEYmkiKlpanH62ij7rR9W/mgkPx4SvWfb/XEOdOv
	Ia32RVzaMDniUDr8nl4MUDX4TGxZgZob0c/5fuH85/yRCe++lDtdvGaCZX/zMUUo
	/LaxYttlIERRBM/K6IUszAiK9BpLLdaq6VmzB27Q++Rf7kOXGUUnHlRLs0JhJIQL
	P4Rwzw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbau1pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:51:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-827185c410dso16913542b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448694; x=1773053494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMdp7LO8XhUCSDsvFwoC4/b9hnTA/D9rEddSM6zJVvs=;
        b=WGoezZ3LESzRqDvHySCPaQG734YESMYUxXG33W1qz3w39jnwwbou3ppJjuEVoRPUAA
         GQdoC+Z86upN10N9hZ36xO8P5skWsmqovVHFXaZiQc/o2Ui7KTYLAANVCbEBEmSBYR6z
         wX59+f5z5b+yenxB4vvLi9pEL0aSHny/vHguEsVyVdqBrv8Or22eBO6Kusz8MXYWAajv
         shnM86BDATSflrVpp89jE2Ks79bIDiqRj/Nibl7SGokCS5oSFFIEDXwo2hjS/pYGCb2t
         hJgDV1SJ9nu7TbXZ8Tt15qKSzETgQIcqJvkDeSN2+XA5/QWN/6C7zY8amps9okwPKcGt
         u1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448694; x=1773053494;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMdp7LO8XhUCSDsvFwoC4/b9hnTA/D9rEddSM6zJVvs=;
        b=ZnTfbfmTLxqF4UwxHELE7TPlsR/wVFACXTK/dICAasAtnOW8o2ulO59jeDC6OEC0Un
         +gp8ZYQOTFc8Kh59zk2Plch7HzmYEctC1eg/NBhz2L1oVB9zDpq4RmW0/l6VddoFI7up
         xzg7RDsGPVyGR3lXKYe39bNwZP/AC40NlFbK1JA6l+Vo5h5YBhKIVBnuRZCedZtCypHW
         +eYvhRpbouQ1USNQ43Do3kNGtJTdjCDlk/eiIhriXcjNyJ5O9SujD/OBNNtQEG9U2Gar
         A4QFJ60Ud04uhYgjQJdl8M6s7+bizYl+b21EPUFNYGLWmcMG+HQ93Kx8oRnMbp/3Fxgs
         pcJg==
X-Forwarded-Encrypted: i=1; AJvYcCU19B3g2496Jj/dUkH7dXZ0sguJdtqlCO4Jw8d8IU5E4kObpyEl/V8TOz51SnweGFwZj2b0eZjwD2dvM0Sa@vger.kernel.org
X-Gm-Message-State: AOJu0YxF/6Otp/myhDFl2Xm/LHJjSdbZjKcVynJubGIC8docAcKGhl8W
	qML3UBBoDNuRx2/rt+H3NcdEU6f3BpQgG0+YImXUrdOou8ShPUDr4j+h/UPpt357qPTVVBCyCgk
	FGFxog5Edz1n5NbGk0AbK1gxm273RfNLIHZM+ICzzdmiTbXAhxwxavlxGOOOaxSlIDBWY
X-Gm-Gg: ATEYQzyjun0k1A11gmDxr2d0FHGi0Tx0mM0ol2mEWxzbIkuHJ6yRrIVPLx585jQm3z7
	KHgKrQGKk4ZI38bTqFhzfck1p9ET38vReQTDM2LucangDrU2SOu+dUXyAqVD7siYw3axaBVAHQw
	YbtPQ/m+H/xAu4+/rO+3kvhuopd5lvi98qlxBwLqSRsyIn+u5tNQsh2Ewz5iKBSnX8TuoOLORA8
	BE+SskKoBqA7eC/qBT9DYEoFM5ZOi/wuts+cUK3o6xtomW/10KLlac6kKrPUeBL/N99rFsYHSBg
	o3hqI2rr9V0ZxVzKAwLGQsI8tBuiNe7wsKerGaMrUUuEn6vNuKr2Le8gjnpqiFWhw8AAYKFWg7a
	44GOHG5uhHXIGjI3H7OXb9wy7NjyBRQtEfIdzzY/A/6JnXrJBNW2o1g==
X-Received: by 2002:a05:6a00:1c8e:b0:823:1c3e:95cf with SMTP id d2e1a72fcca58-8274d9b4f5amr10137876b3a.18.1772448694175;
        Mon, 02 Mar 2026 02:51:34 -0800 (PST)
X-Received: by 2002:a05:6a00:1c8e:b0:823:1c3e:95cf with SMTP id d2e1a72fcca58-8274d9b4f5amr10137856b3a.18.1772448693727;
        Mon, 02 Mar 2026 02:51:33 -0800 (PST)
Received: from [10.0.0.3] ([106.222.233.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a05cbe6sm12948221b3a.59.2026.03.02.02.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:51:33 -0800 (PST)
Message-ID: <7c1cd1ef-6d4c-c4c3-9f2d-02f28fdd82fe@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:21:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: venus: fix QCOM_MDT_LOADER dependency
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
        Robert Foss <rfoss@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216121525.2311140-1-arnd@kernel.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260216121525.2311140-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfX1tEZU+JaaJhY
 yFNhH++U7OTgG3iCZ+Kl7wPnawtvZMkm1LtD3K5mgeCcBN0JyQmdX85afZrlfFMzFkJ+hYm3Izx
 MVa0P4ZgnnQOA1RY8tYmDqobN9PP95ERgcq+OBdA/PTq/Ne/8ZBytjzjr4xuS/xaxLhyTaUtnCF
 mEoLj60SXDvJAdquwVHByxdd1TCOEfybcAsOtMlaEfdD3oasPo0c1HA3fSObSAisVinpFT7OLH2
 Hkaro92Wm2uqPgV8k7wIR93w35bi+ZORYSbgivT4nR0mkqhYpi6iYwwAS89YQeZTpnxTAO3rTQB
 dueoPeA/4pi8eljOAaxvH8LtM1nt0wIz8JI74Wsr+ZhO4k+EPXZrflWvnJUpwb/X8hkRUZZnM7Q
 HPyDzUyjTyKg/7JTacfEpW4iPf3qm51rnP3ODD2iKmqqHttHGN1jzsFPWbPmZebJQXe2kLZsxdG
 kbkLiEmWEkEXzwIcmmQ==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a56bb7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Rcr8AszoUWCL+GUTnXSVkw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TxWHU2ARYOkZREXtdToA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-ORIG-GUID: gmUaGgTlRfjD2WteVCpv0X1w2wa79UNp
X-Proofpoint-GUID: gmUaGgTlRfjD2WteVCpv0X1w2wa79UNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-94865-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C0821D6DAE
X-Rspamd-Action: no action



On 2/16/2026 5:45 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When build-testined with CONFIG_QCOM_MDT_LOADER=m and VIDEO_QCOM_VENUS=y,
> the kernel fails to link:
> 
> x86_64-linux-ld: drivers/media/platform/qcom/venus/firmware.o: in function `venus_boot':
> firmware.c:(.text+0x1e3): undefined reference to `qcom_mdt_get_size'
> firmware.c:(.text+0x25a): undefined reference to `qcom_mdt_load'
> firmware.c:(.text+0x272): undefined reference to `qcom_mdt_load_no_init'
> 
> The problem is the conditional 'select' statement. Change this to
> make the driver built-in here regardless of CONFIG_ARCH_QCOM,
> same as for the similar IRIS driver.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> See https://patchwork.linuxtv.org/project/linux-media/patch/20260205145623.1360105-1-arnd@kernel.org/
> for the corresponding iris patch I sent earlier
> ---
>  drivers/media/platform/qcom/venus/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
> index 164491c5c374..075e08eaceda 100644
> --- a/drivers/media/platform/qcom/venus/Kconfig
> +++ b/drivers/media/platform/qcom/venus/Kconfig
> @@ -6,7 +6,7 @@ config VIDEO_QCOM_VENUS
>  	depends on ZONE_DMA
>  	select DMA_MASK_31 # technically 0xdfffffff
>  	select OF_DYNAMIC if ARCH_QCOM
> -	select QCOM_MDT_LOADER if ARCH_QCOM
> +	select QCOM_MDT_LOADER
>  	select QCOM_SCM
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

