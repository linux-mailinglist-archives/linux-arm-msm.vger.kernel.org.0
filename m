Return-Path: <linux-arm-msm+bounces-108201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIn5HWsXC2o5/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:43:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA5356DDA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2ED9F302BCC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A2B481FCB;
	Mon, 18 May 2026 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvsvNBvh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/VxpBFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71393793D3
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111720; cv=none; b=Jo5kmvQ5TySjc05KY8Ju/wA/r5ZjNpoS5eX5uz5sKv1Ehxve6o6gBjObnquxc/4zBcy64fd7z2uoGiP+mjYNt4kOUIOOU2c1Rm6cDJr0l9cmxkDju7afCf3z4rJ4fDJbBxI7xtoZKl4i6/UX+neSInquHK94/WSDe9w6oKm/ajg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111720; c=relaxed/simple;
	bh=ERa9KGcfFMbzXPZhSgeHUPTZ1z2PRDKTu5+uRwX8ig4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fvxfd0m4CZQDCPYTP6xnThrKqBKF5ImifUJdIdoKI5Dlx6tr1n3puncT8fw2woGA+tVLGSiE7EJelJagVTf1RBNVldbhHvLi0YN+bK1gyt2M0WGzgDB6omp5xfxdMC9vZmLeap2cln+Ba9s/JGfQ3yP7yvGiTJiSoUlsjfE2hIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvsvNBvh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/VxpBFx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAonwL2083011
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOQ2L+lUTrqPio0b+Bre2mbX+LErk3gfKwpcIuQXOGQ=; b=XvsvNBvh+ImGM9dN
	EdvOrrKes25dpNpUss/uQAOFvfr0/xfL0bzSQ3sbYtXci5su81V//SSSZoBWRNlR
	jGFVn7vYFxOyaQ/GmY+rWyHbwWi/exKMmBUZAhCGJzWKBXLmdMRcz09KsmR/gY/Y
	hsYk+nlcDcNHpRZieUfsWMkOX2zxRdaVqZizSkz/jWPjiwqPKzglUG0Yq7qTEc5u
	KchQBnfbhuRleGWfJ1TIelvBETpmr8Nsrhzt2Q/WtZuYkqdpiBDRvFqFEltKgppX
	JjNt6ZPLNJIh089N7+TElhTnk3V8AKshR52I5SkxIuL9JiLLdB5kdtdjN12MAu98
	ymo+dQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81ch8nmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:41:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d840206c3so8694031cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779111715; x=1779716515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOQ2L+lUTrqPio0b+Bre2mbX+LErk3gfKwpcIuQXOGQ=;
        b=Y/VxpBFxQbFyjfpc+EGAwWIlEIKvWl67tCv8rf2VKXqRL4Mr+woYMp2U3aFBTlVQlr
         wMfVN+Y9qKWIUBuJTbDnnt+xb9s9iQkwELaLJKc9+xRluxJcO0whCJcoVoP1OMxJMCcO
         qcKDP6DuPZWuTPPT1DA0PdA35fwSwlNyaP6r5Rbe2bEi2VeLKLhBgfuFXWj1nZglLrHN
         aA1lDUrKhfepCHGWGKt1lQX+0BG6JvUYBcSK3h0OFN3ZeU6NcgOeKDqsIaGtZERlJE8/
         qm5CaDhKZbjBGaqf2fFI/b74YGtssnc4oUB4PY0yoMqfLXoKMfLCn+pUsljkshiTMzYG
         gDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111715; x=1779716515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOQ2L+lUTrqPio0b+Bre2mbX+LErk3gfKwpcIuQXOGQ=;
        b=Wls/9U2MpIOzEu9j0vMCLU+o4ilAYzUp+CzkRoa1fRwaiDHUaevfECMegY3Vh++oQ7
         VWuRl97fzMabJm3UQX2pErJ4nQHk4EQPriKDgO+SKlTYbb4GKHlOYdSN9Gf4ruSUDL5Z
         GKwKwqU2k+VAi3KQ/9tqJp+IiVmnp2oSzf80HnZ6TFwYTqcsYqq/VO3fgemfpyBvMxKV
         VSWaV5WlZnmxvL5wdrlXfkfLKHJSN6E/wsRF0REa5DrT9gCZUCqGrJvSR0JyqDP9vqy+
         onw8eXOVZk6iPlR2heaJmFKFzh165nWiJoaOCcRLcw4XqGsF9vVYHQt4DOsj4e+DU2+T
         rp/w==
X-Forwarded-Encrypted: i=1; AFNElJ9Wj1n/qtehGkSwW8lpiFfE5sVFS8IIQzXmF05okWjPj4mrWxooJCQUq0Wq5ZYipV4IJvlejeQMjV50oTl4@vger.kernel.org
X-Gm-Message-State: AOJu0YyhTWLGbjW4okaTp1RNmOzkCGfeGnQTESeRuc8ItlZMDU1Zwu4z
	E2n1YLS13a2SgurtCnzgtXobMUMIqWh9f1buosrnlWlTLdGrX/dgX0UUK9/U8SKr39Ur0HNBK2w
	3J5tTFn2dBqrK32eQ0IDXKSYwVZBN2m1gwfdiBphSVyCnrtXb9CLZ8/FjOOUqfasVY0no
X-Gm-Gg: Acq92OE6JhRw4bpfDa2JfbQGK4Qu/4xUOaqwUObj5crJiwUIC8aqFaQFwgGC+9ZpCRT
	iQTviv/bftjrAKRq47HVGh+6wg4YPsxuVZbSYXCk40fOEIo86+rRcKJsoa0dzYd23iS3l0sREpc
	Fo0Wkk6UqGOjufvLxxpxdbDLqQfgw+atQge24EI6cjjn1T8boiOBtUIh5ciU5onmcD8DB+q6T8T
	dKC+YM7Hot2ZImuYqMEVw9tKA+mGI2BaDCYWpMhzYr2vfLHNv9DW1SXzkoxQvnex4xVZfiL56z2
	PJs9dbLCQccdrpK4Xuv1iOampSZuZZijKTxCALGhd6l/4knHeJ1BunJMQbJF/1giBHj3FRHy9O9
	6fhlXJMahUgSjowcqoMUrumBadN04zzYFeMa7HhvzoIupGMpmP2LGJNg3rC1AEsHvbcIXH0iaI8
	MK4rU=
X-Received: by 2002:a05:622a:111:b0:50d:5af1:65bb with SMTP id d75a77b69052e-5165a1e7299mr143825101cf.5.1779111715504;
        Mon, 18 May 2026 06:41:55 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:50d:5af1:65bb with SMTP id d75a77b69052e-5165a1e7299mr143824661cf.5.1779111715037;
        Mon, 18 May 2026 06:41:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dea94bsm563155866b.33.2026.05.18.06.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:41:54 -0700 (PDT)
Message-ID: <a5cbe0f6-bb58-4d73-a5d9-5680accb25b9@oss.qualcomm.com>
Date: Mon, 18 May 2026 15:41:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] serial: qcom-geni: Add tracepoints for Qualcomm
 GENI serial driver
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260512-add-tracepoints-for-qcom-geni-serial-v2-0-a5726421b3af@oss.qualcomm.com>
 <20260512-add-tracepoints-for-qcom-geni-serial-v2-2-a5726421b3af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-add-tracepoints-for-qcom-geni-serial-v2-2-a5726421b3af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4MAM0SF c=1 sm=1 tr=0 ts=6a0b1724 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Vhne2ItbJHd0rvwzwroA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNCBTYWx0ZWRfX3Emf5AfjAG67
 XFuSrCZVWpzu8DpQ2tos+P0YbjhWKP9SBtVCBOwp9X9m36mchFAHEgKzkKifhE9uMAl8yIYjwBF
 VbGgdQ3mJZsoTDWv7tpevswV1h2rv4v9j559W2S3XIjasgmcK7XnYj95gngV5skZWWTU3tnAkXl
 etqQBEcfYbWRbM+gZeOtgBX1WCcFap1xTpAXeoU81ukSOMA7+bSGG2rdhKma8iNyB11i6BKcBS7
 LCSs2i2FgRgd4kYzS/J32qbFfCep5try/XFugQpt6fE0CE9qRkEq/2rEi651VZU6zwxe2IfSl4D
 DvB4iRtwD/wdyZVJkNK0DjMex+0EGeSCckIjm2Ng7KKOKY3uT3GR5ojWhD/UnnkeBx59uzIOjSo
 23lD0cKwB3foZHaRGVqvGn0Az7POjiF8k2peybGv1xp704vTQeaVkPSC2rkVh2hYA+tDWx2YFmH
 /BIW4yCAihj5n5UCzhw==
X-Proofpoint-ORIG-GUID: qMXh7R_1Pua7iUFubEmhdNAntSzQOMeM
X-Proofpoint-GUID: qMXh7R_1Pua7iUFubEmhdNAntSzQOMeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108201-lists,linux-arm-msm=lfdr.de];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: CAA5356DDA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/12/26 7:14 PM, Praveen Talari wrote:
> Add tracing to the Qualcomm GENI serial driver to improve runtime
> observability.
> 
> Trace hooks are added at key points including termios and clock
> configuration, manual control get/set, interrupt handling, and data
> TX/RX paths.
> 
> Usage examples:
> 
> Enable all serial traces:
>   echo 1 > /sys/kernel/debug/tracing/events/qcom_geni_serial/enable
>   cat /sys/kernel/debug/tracing/trace_pipe
> 
> Example trace output:
> 
> 2517.938432: geni_serial_clk_cfg: a94000.serial: desired_rate=1843200
>      clk_rate=7372800 clk_div=4 clk_idx=0
> 2517.938753: geni_serial_irq: a94000.serial: m_irq=0x88800000
>      s_irq=0x08000111 dma_tx=0x00000000 dma_rx=0x00000000
> 2517.938803: geni_serial_set_termios: a94000.serial: baud=115200 bpc=8
>      tx_trans=0x00000002 tx_par=0x00000000 rx_trans=0x00000000
> rx_par=0x00000000 stop=0
> 2517.938807: geni_serial_set_mctrl: a94000.serial: mctrl=0x8006
>      uart_manual_rfr=0x00000000
> 2517.938818: geni_serial_get_mctrl: a94000.serial: mctrl=0x0160
>      geni_ios=0x00000001
> 2517.939165: geni_serial_irq: a94000.serial: m_irq=0x00400000
>      s_irq=0x00000000 dma_tx=0x00000000 dma_rx=0x00000000
> 2517.939592: geni_serial_tx_data: a94000.serial: tx_len=8 data=61 62 63
>      64 65 66 67 68
> 2517.940610: geni_serial_irq: a94000.serial: m_irq=0x00000001
>      s_irq=0x00000000 dma_tx=0x00000003 dma_rx=0x00000000
> 2517.942174: geni_serial_irq: a94000.serial: m_irq=0x08000000
>      s_irq=0x08000100 dma_tx=0x00000000 dma_rx=0x00000003
> 2517.942323: geni_serial_rx_data: a94000.serial: rx_len=8 data=61 62 63
>      64 65 66 67 68
> 2517.942680: geni_serial_set_mctrl: a94000.serial: mctrl=0x8000
>      uart_manual_rfr=0x80000002

I think the example (or at least the data that it produces) could go
under the --- line, there's plenty of docs regarding tracing on
docs.kernel.org

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

