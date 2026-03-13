Return-Path: <linux-arm-msm+bounces-97331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DWUKeK4s2nbaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:12:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E4827E971
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F1A1300C6FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0833659EA;
	Fri, 13 Mar 2026 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFj1r99q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVcVV6yS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920EF365A13
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385941; cv=none; b=cPkHCpqj88bIXvqXTqnt5soF06ZLIZ+9vsklA1XE9CEQ493gUUZMoY18zjcIc7bgh+6QmU+BQXqrkqit/vSZkdKtwVjiWr/M5U6XfqMda2OnxUQsi0dsiaKmskfelzLmHFPx/UYDnTJ56KLSzZhklpqhORZ7Pyt8TR9gzXlenf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385941; c=relaxed/simple;
	bh=kU1LxKO+gfnLo23WuB077Uf1w2qv8sp3P9dLXYf5t54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpRjJSE+PkPS/MsLeDGe4pdrg2Kzg5RU1mfdGSP+hppzyKO8Q0g8v615/0QMmra4rTavG0cLpvWCdikEol8Or5J4Mh428ZuUJCOGVPGr2j4tp57ohAQiSHjSPFQLvP72NRh5L9oty1eD4vjNpOgyxbD4p/Zgx2eDr7qMN6Zd7Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFj1r99q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVcVV6yS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5thV9070734
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DRAtWsYtD5D+8dvoXK8BBSDEPUqAsU5rlDMPdgdA3v0=; b=DFj1r99qoE01/dcm
	gk8bA4KGCOmEHQ0kdk4qD34xDVtq6rJaO9vJRhlOBHfe5ZFVi6LMA+8JvCEAvcRx
	UKuCeEqQ2PrpSrE86GcTBEymu0eEWPUSuIEHRD4cwhO0iPPQkMoQ0PW/0UOeahsr
	Nxp1+jyzJf2iq1zKM88z1nhSf+BmHgRVb7oPSrx/IKDHCgqaqFluA0B0nismdtCK
	q4wj9WvPJ5JEdPHAcS2UrKNrwUw6bjYd5CCfxElqNrm95+uvvetxldtE9hAmFq8m
	oQvcEPTUTbo3fX/m/WCqggZEmEWFrKxx0ZdbT5EpHFPp0BFqnOUVo3vTuacgWITZ
	JhprCg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4ymxmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:12:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c738bebd53fso7270682a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 00:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385937; x=1773990737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRAtWsYtD5D+8dvoXK8BBSDEPUqAsU5rlDMPdgdA3v0=;
        b=CVcVV6ySZAL5MjlgRjn2wexGcMNNz0Z3obcRm3Hq7AauIsq1GB/vjcZf8bqVjeUg4A
         ecB5ZpkUeb8qXMUCdar73Epd5H0CVHUaEgRc/YfvIrXHuxyo72lS7qac2C8IglAOxXiR
         3y6s8h/FgAw5VaufvXkCmnjkN3yFw2caKUsiDfi2mNkL4cBEHKZAWUYznnJQU35hZ8lN
         TeqpXrFURT3wNrd8UFovACNY2fXm97z5ez5Q7fwfsobFZEUFPqgOi0otNXyIIvvRNs/8
         tHi/kCJUU1sXxXHFqbmeGb8QF0ErHgfDXU4+cyLqFOU6Fm2gmrVe3QT2flRVRdhhkF4e
         jTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385937; x=1773990737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRAtWsYtD5D+8dvoXK8BBSDEPUqAsU5rlDMPdgdA3v0=;
        b=XKYWY6UrytUmqKrLZiiAOJLbap4x0KB3qt5SnB8YTW1x36CBAxtx0IafK2H98F7spa
         y7xRQusKnPV5mygIXZ0yJrgFOgJseKIlCUII0WyET1cNlX6m5e0vzYPuZxrV0xJ2NoGH
         I2YrsBdH5h993vwdFvgcbjuze3R6JBxPFzQrk1hNmlx/FG9kPCTKPZ5MQQZz1cXO0J83
         SjkyNTExPJjM7ZUnMSK1d/jZ9Itriy0SiD/3kRvhmeMSxXINyV1ijpyKKYdEg3vRwJg8
         vXszuC+c6EFk9kzR8DHT+8Ouxt3wWZNCSKzpSZDEc2tKcAliVQGMxVJ1IXaFLylcSXRV
         Z5DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwZpBkZZklrVEYBxi/2CORRpLI37fAdBX9WidNJOdfT0xjkB/Fye2G0Eg2tIPYqyYTQAn5QiGKlRSDR+2P@vger.kernel.org
X-Gm-Message-State: AOJu0Yy05G0J1iKRgPNa3o7MQad1QwunoY6y/kEwjoTmEeT1phn6mw5D
	Qdjp16yKLXgI76el4LUqlqW9sDy2GWzjW50cxHeqepG6uEw0dLpfGCEkdK8vjzeD73DTUwf0w23
	t4yfZ+bk03dlR1D7jus3nCE+bRXt0B1TBp1XVg83bW6WfHA0m7I+GKqbyOSAA06YkktxI
X-Gm-Gg: ATEYQzyyfqZn7trNpAtB0ZCQ4MyEVO6jiPzOb5Qv3qConpaCygrakIFdITGnujJvDkQ
	SO0RUx0LqBT9loMW0dInx7FRPM7Mr6R831CQkQcHdmduq3V5XobNqrISVAfJCUXXf4C8qFhosH6
	X2yWXBANY3iHeskDuaNQecH6UyN5Hgfu0rsw8SCW02nuOhYHU8E8YulzjQ48sGdR8SwsICTR1lj
	GlS4Qlb97MMoO4FgAY7Gzjp20USapsB3ak19soqAHbscpu0Im3b0wzYtpbiisQQNqre+AZNaNcW
	x22Oy0mBReF/OTIUm/uXPIQnf7ojBfdUGjVclMlLn6+0am5XledVai8Tau+h0aHGdKbajizRJqt
	uCfZTHBydWGUqVet6IHGN9hQrBPZcYzQIhiBNsWUIszYLr7v0NOf1
X-Received: by 2002:a05:6a00:37c1:b0:829:7d74:d0d1 with SMTP id d2e1a72fcca58-82a198ef50bmr1387655b3a.36.1773385936419;
        Fri, 13 Mar 2026 00:12:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:37c1:b0:829:7d74:d0d1 with SMTP id d2e1a72fcca58-82a198ef50bmr1387640b3a.36.1773385935961;
        Fri, 13 Mar 2026 00:12:15 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725be23sm4916467b3a.15.2026.03.13.00.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:12:15 -0700 (PDT)
Message-ID: <b1c005e9-f25e-234c-9435-a36388827a17@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:42:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 5/8] media: qcom: iris: merge hfi_response_ops and
 hfi_command_ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-5-14927df4906d@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-5-14927df4906d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NyBTYWx0ZWRfX59SHvty7Rvt9
 PPHOAtaa1YQSyqk2+FEaUxwxTkDdil8fBfPZ8hNzSNCgkPyv7kjll9RZdUZ2sJd08EyTLdtar0H
 GjdieO9yr48ue8V30Qei4ROzJvof97ps1dBwQX+nfrthuHfLlV+0eVfBDl+kFPgXmnAJBz2uGlz
 iYndOlwb+gyUVNSCDsiBlGt5neMz3yh5bxakJO40EENgImErWlA43zksoobOwjpB1W0GnSulckP
 fXNBP+iU+0vrldV1fx2nPVvLBm2z/EpXkKOtzTo3qtlIh+dnwx9gJHFvnEuVw8Ilsps1+Mh6kid
 rDogLhpGm7Ob8L79I9dccOQ3lJfOFJMCjwT3zGQehvmfn+a2CIWcWd/NuOVL/63Ra6NR6kAmP4T
 dkmN/yYIQADRQbxD5Gcv5sGNiVAEzaJjC5T69jys6kXswjmhj/QMku70zZrenCbEkP1vTWuhsUl
 SCp0/NjRUpwkQPxgu0A==
X-Proofpoint-ORIG-GUID: YnyH9pf5aMSYFnx1pPs52el9oqBgScR4
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b3b8d1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dm_so_nJLi03q6NOErUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: YnyH9pf5aMSYFnx1pPs52el9oqBgScR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130057
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97331-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80E4827E971
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> There is little point in having two different structures for HFI-related
> core ops. Merge both of them into the new iris_hfi_ops structure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h              |  3 +--
>  drivers/media/platform/qcom/iris/iris_hfi_common.c        |  6 +++---
>  drivers/media/platform/qcom/iris/iris_hfi_common.h        |  8 +++-----
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.h          |  4 ++--
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  |  8 +++++---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 11 +----------
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.h          |  4 ++--
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  |  8 +++++---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 11 +----------
>  drivers/media/platform/qcom/iris/iris_platform_common.h   |  3 +--
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c     |  6 ++----
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c     | 12 ++++--------
>  drivers/media/platform/qcom/iris/iris_probe.c             |  3 +--
>  drivers/media/platform/qcom/iris/iris_vpu_common.c        |  2 +-
>  14 files changed, 32 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index d10a03aa5685..1d9a435ee747 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -112,8 +112,7 @@ struct iris_core {
>  	u32					header_id;
>  	u32					packet_id;
>  	struct iris_core_power			power;
> -	const struct iris_hfi_command_ops	*hfi_ops;
> -	const struct iris_hfi_response_ops	*hfi_response_ops;
> +	const struct iris_hfi_sys_ops		*hfi_sys_ops;

Missing update in struct documentation.

After fixing, pls add
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

