Return-Path: <linux-arm-msm+bounces-105638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIkOMDQy+Gl1rQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 07:44:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C175F4B8A99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 07:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F7A7300F79A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 05:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2261A285041;
	Mon,  4 May 2026 05:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6YynaN5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCwwQf28"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E29284881
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 05:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777873321; cv=none; b=a+yID6ngeXgLDPnOHAmTVX+wr4V286SgFUbtJlmudTjx9sknrCKhK2N8IMgY8x3ZA2WunDSsQ4Ahleo/zTAcePN4g7x0Cm82GAVB4Gb1iDxHz74TPXM6XPHEUYSAV6HgpmdM4vlONzyr2x0ivGaotqwTR3qc2NKegY6WqDXsHGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777873321; c=relaxed/simple;
	bh=ayZN1CjPuHoiSqFqdoT3yNtgcowtRvwd+7Cuzfa/Lrk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AYxMYxKRvwjMTObYQX6JQ4hUzwk1zs2W0x7mIqIYiyMDaO6ZOyhmdN7bF2h2kDytrcvOUpZcVxMMBcfDDE1R960D5vyb8muzz9CDTVRjaiAyzRgmEFDeFGi2K+N94JmyPdpytd8AcSORWISRvcrfuwuc9p6Hva6UEZZiN9J06CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6YynaN5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCwwQf28; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6443nHr3570816
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 05:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ciq+urNIWZLv3PTQAuHFezEAYLVh6k3QEkWU4p9VXIA=; b=g6YynaN5sdlxxvsX
	I/IcTew8WJE6AGsJBYF0YcNU3xtpZeJS0NkKN3ZwGjnZ4llYmiO4xE8nHC4HMEdC
	zPLkmDL++s6M3XXTyMPRXeLv35SFe50eGQD3zizWDU2cKEYOTivUFJT1Ygj+n+rO
	nRYbNONWuwduSmO1Odlnn0SNBEySE2ZWxcsLeKMZGsmEEW1m0SbvJk94JWB2A1RF
	WV/VacXkyiGbozYp7xmaGI55TNHl1PAcn/cE5GcymUqeL7rfueeEHDTqNuROCUQ3
	3JIP1ZIrMqy9/ItGfZ0C8molpvuS39jeW2KqLSQO3NJoQB3CFyV/XtgGKC9XKVwV
	6CFDDA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1emae1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 05:41:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fbaada0caso3526155a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 22:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777873318; x=1778478118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ciq+urNIWZLv3PTQAuHFezEAYLVh6k3QEkWU4p9VXIA=;
        b=jCwwQf28Rr0+2qisJo7M1y8FwnBrUOd8OIt7PPL4KCn/E5/a4CgCCLO5TN4y5DVc0K
         4pb5ms9QS55/r8lyXzoNfGqD62Lkm59iBHXvF85CEa2G2dTl/0RplrgAEjbmJRXnT05b
         +gwJc+LA2teNJV6UqF9L/jjYI54AP39+GwY6vdzggHVfNdyho0Ey0o+x1cPuou9TWxeR
         jD5s1v/ddp499D4hjbtpi5IUf5ZaWddDUiVMum0C72xRyqCXgv1QhScxt2+2+sHYBahm
         enj5sdQk53TsvnMsfPo5LOROOgo1iwraujRjK93zGgrykZH5whAHiotRTO39wT1jGb60
         cPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777873318; x=1778478118;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ciq+urNIWZLv3PTQAuHFezEAYLVh6k3QEkWU4p9VXIA=;
        b=rp7ReETgSE9ePXlgaV/OzY6JGqHNbtXK9wLWwK5JsfKHAUQ5+zf98wEUZ2ynMv6T6d
         QKEeaoDJzDViSpW8t06bpP3SfEUnVKBUyxLFnbOk7TgAfoXx1UT46gzEX6euw2KVLUhI
         /1eVsPWV35FEnL54Ba1ooxCIT0RHNW8ik0ARSql27ErUMTNRj007it7pazwbw4RtyBnm
         U54rOWncIMjA/3/ecBmwNyG/kyqIwZlPY6jkSbhlMPpvqpDV2ML0bVH8W1rce5rEqd9P
         9IwQjRurAG1dNF6gzRw1+jhzz9NBm+fg0lkWKbBAxNjayrcK9tolkxtHGKjElJffulhu
         iKAg==
X-Gm-Message-State: AOJu0YyUh8wXT5J6g2AedMgGFzbww+R/oqp0s65ZXoDHyzEEjIJFx3iq
	anGBdEGneYD/k6H0APFWsuj/iW5bHvJsM/dw2qchnWrvjKQrWcSSEU63uQVaseqc9mhWrwMbDi5
	ZQsfWxewIYbH0u4W3g1Ep/O6WWhdquEKcqVNu9yaANzwJS2FzvSq1CROvzwu4nG/e5XMC
X-Gm-Gg: AeBDiesJVotuOUHL3Pl2XoPwycY4zKNDqrjetRiSb/WEpgJFCxS/hJWNJSVVpHfATSG
	b87YQv0U+SX7fagcPu/iw4R8Ti1migygnZhWwurYDQnp2lMAHNKCnS8jOlYf5M+3fmIpbuAa8Ca
	/3JFbeVgxY9uLcY2xBEXpmuIHKmMca/2BI0fKoeIuS8FvlAgFncH4gu/HIxQovZO1g2ngtHGtCx
	43uMCFb339v1ycdIqq+Lme4I2uziqZpB+cZh6m6PO2q2ivFl9r12blOz1dI2gbvHDrsUMRXyfJY
	A+Ksa7tbMnomTx8TzkUZn/hBYlR/cdGShmA/748rE1rGTcOQ48j20DQpeXCoNveO7ghQN0R9ZYT
	G332jPCtwh/RZihaAnMQIYv3/w8LVnOOr2qQVOvVUGMj6OPMKPANo57q3
X-Received: by 2002:a17:90b:4b11:b0:364:a010:c6ed with SMTP id 98e67ed59e1d1-3650cd4b29dmr8355556a91.1.1777873318450;
        Sun, 03 May 2026 22:41:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4b11:b0:364:a010:c6ed with SMTP id 98e67ed59e1d1-3650cd4b29dmr8355538a91.1.1777873317933;
        Sun, 03 May 2026 22:41:57 -0700 (PDT)
Received: from [10.218.21.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf2aa41sm17083590a91.4.2026.05.03.22.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 22:41:57 -0700 (PDT)
Message-ID: <f023e969-81ce-4d61-9877-3bdb3df13079@oss.qualcomm.com>
Date: Mon, 4 May 2026 11:11:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Haritha S K <haritha.k@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add passive polling-delay to
 gpu-thermal zone
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        gaurav.kohli@oss.qualcomm.com
References: <20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com>
 <b86f2bef-206d-4399-94cd-70f7a6859605@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b86f2bef-206d-4399-94cd-70f7a6859605@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Flhg2JpW0mf6gXdmeQzIIYSP_dVz_zDB
X-Proofpoint-GUID: Flhg2JpW0mf6gXdmeQzIIYSP_dVz_zDB
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f831a7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RoOK_9Oth8sowyBx_RMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA1OSBTYWx0ZWRfX1pWfGrfZuPbe
 HpIhoniGIFo42RW3e2YkW9lwkIYGeKLujVNo1zO10gik2s+rymwnTJ8NXusyOPQUmcrIBLJk1Hq
 QeVFocFABBgKzQpLICiSkLVWAHX9pr4U4gfsJkpJtrXuoNYRjXCPynUuX/Ny7AZdm6aKLsrcpER
 aSW5plt5hpkT8x5imXGZJDCAs/NTnRbXhYA7jC4cFTfyXVAlSVv/QzGiTqGzvLklZJkGL4CR4t0
 ppDSsex+jDn+QCE6JgJcFfk7k3/wBGjLA1uLUSWigr1IracvvKdALScKGMOcS3khXLPqiBTUP3G
 0SO8Ui2pixi/MHMUQZcHwb06MeVr0bI7/UG4GYL0e992sd67XHM6ROB6+RZKGfee8r+2qL5fkD+
 slZGut9u9orjsyZnQXOwWKbEHiVgy2fTUhKxEQFdW8VTmH8R8aEIACiKwgKHA1AGiA8eNpGS4TO
 3PjH+DRga1yBAGobMEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040059
X-Rspamd-Queue-Id: C175F4B8A99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105638-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[haritha.k@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]



On 23-04-2026 17:03, Konrad Dybcio wrote:
> On 4/22/26 3:45 PM, Haritha S K via B4 Relay wrote:
>> From: Haritha S K <haritha.k@oss.qualcomm.com>
>>
>> Add a passive polling-delay to the gpu-thermal thermal zone on Talos
>> to ensure periodic temperature monitoring while in passive mode.
> 
> I feel like the "why" part is missing, i.e. the commit message should
> state why that's desired
> 
> Konrad

thanks Konrad for review, will send v2 for this.


