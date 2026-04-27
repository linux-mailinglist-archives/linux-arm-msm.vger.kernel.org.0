Return-Path: <linux-arm-msm+bounces-104696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAB/Muc672mD+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:31:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 725044710B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58476300132F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABC52F6910;
	Mon, 27 Apr 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAqqMFeV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvBA1vf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCAD30DD3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285858; cv=none; b=Frv94w1bJpJBaAQjyAh6W+u17SvmEZUi3c9JCKDAW5W8ARtzGblszleKc4SlZ8swcmgIoxd26FEwzINrwhoFckNwk2KZ7aBjxeDgFiK2ebbrCeuxsNfmL5IL3VF2MYERDlTEEBknmK1iKDakDXMB80/3O6omFKegqMB1A9CFxfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285858; c=relaxed/simple;
	bh=xdBoUnvTDWHO9sEx2ME9vk0lNpYrxR1F0k+T/dobLLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o26gp1XKlZg1oW+8LNb5WoutGdx/U5m3X4Qg2iYFgahkScaBiJyxbMD6BDygVbdgqQdpHAzIDXIcSoBL4hZ07j2S5Dx0Zg1pDwsbmvjgDqqkU56/P6ayt7IUdcnKz6ub4++AWya7J3F0bGfQECp+E2rVh3RPXAzRsbrv1TTMdkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAqqMFeV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvBA1vf6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T8Mn3639605
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hribx3Te2zGhpwNccaQ0/B4nggOh01mXDEMzMU2RzM8=; b=ZAqqMFeVbWvp3N76
	xshBvYocfLZXIdyiltnKdHegAs1tSBQs4ss/RBz8LnhAKhkjo8X5bfvMORkV+3Pb
	HiCF+Nzb+sTIzisqgzC5iBmKA818F0bKVMxrKncz2HUMHijnmRqNqv2BQtLM77WP
	kjWkV2bxnFO71WBwqVUk0OwpAT48CFdfiZa95CKhY8Sx1vnuIImMwP5l9BP1F0c3
	2cqQ9wbRUBB1sFTLXqGojp0F1YWbsSm2+pKjBUm+B4EmZwA8Io4L+tUmJYseAuOt
	DNiUd1cOUOzfbWlZewuPkkzcn61wz8yM1W3JWWokz1OmbXX73OEuygQr+x7J4WGR
	JtU66w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya01nq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:30:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ffd4f8291so2693131cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285855; x=1777890655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hribx3Te2zGhpwNccaQ0/B4nggOh01mXDEMzMU2RzM8=;
        b=kvBA1vf6u1ao8ePuhOs8wU4HSCDp7g71vQgsmrix+URjPhApobIXhzR10OUSw/FMrl
         Xp5BeNiU/JWWUC2pSRyWbIBBAyWsT35nUZ9ltYQzjvrrShaaE/SCoTzoUxPQ+GtVZlDg
         dgoB4TNgrJC/NUi6m6dnYTW0BI3RVpxNPy8ipx7+5Kwx9vs+5oWtD1ikPFbqQ1cDF7i1
         N3C420XyV1vZcwlvSZC0KT/r5VTjPF7YA2cM+2rSf7DmT3X4kmnbVDTq/kayVBtx3GxE
         vZ7h5Kvc8yyi04gFU/8/VLlM+0lk37PTQFgsaGVQfFanyI8d3grXNTD1eH/OGq7SWIgw
         EVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285855; x=1777890655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hribx3Te2zGhpwNccaQ0/B4nggOh01mXDEMzMU2RzM8=;
        b=oD35VkC1az6fhKJcFeBlyLZxEBrgPji9dOTJny3rz70CV3Q3iwCUaxcsaMYBv5xYUB
         QncSuuH2ZS4SA2Y0phGFZbipIcwnxT/E9Am6Q5c3i46Z4C4zv1q7O6RafbKr4Oh0U4+E
         KtOsELHHHB4jVI6zGFfOxzgutgGZHVPqbKpianTlCTTKJfLzy3BjeS5P4+bLfXcru2uY
         xPkVWbZRFaRMLSbDNDHrI8Cfbtv+MDZo1mCsOExyBWNVmPSoJBlDHrJ7Z4eul2T8ijUT
         hWsAiUGtpcLjoTyL1TDLQeYrd0z2C3TmxZlYkMUbHds2H2x5WbvU92rfO0sA67Hjs+Kk
         6g4w==
X-Forwarded-Encrypted: i=1; AFNElJ+z413WRfMXDyjMg1F8jXPEK+6YGKPWhFCQb4X0VQspbMRWj9QN6dIapT2EMJ+ULetZruUNxVVXxSrylnvd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl8NiRK+6n3QO1OI+9/wuoF+K5xxq8Pacfv5/oShV4C1LNeQ7l
	1S0pRfNpZgQgLrgCGES56ZEFJLresAFjq/1K5sYAVobagQ3vViLTzH2tPfBt+i8On00NkcAtBPv
	YsFMfeHGyQv8Nz6GkuqOlcWyvsFO4vgV0dV07i3RCsCYtwOqACNboETrjW7wJ7uenB7+iTbB+u4
	gC
X-Gm-Gg: AeBDieuXRik4MC6gB4r8n5B620AKrdisxoz5M039rVkugK2hJzXerXnv0h5UtTa2mTa
	waczJAUty7l+8Mo2x5wxfAf88r+Zkv2AGcipQe0gKHmxWw2ITgTz0CPr7bYyoomcLuRUaOuC8fX
	NqX7W5RopBbmzXwFq4M9RehIww5B9xpvEr4AHet6+jtlMCkGIOoydnTt/T3+41GaFy0tvwPxnEJ
	HrQzaaAjNe+a2hd07Nye6F+9PJBI4CkaQeDJmNqa6xK960F3cyvVI7xhmE9vxXA8AGvzyN8JRTw
	d7sbl5PsY/OxEN6iN0DtYJxByMNqi4PyACutp+9uGFngD4q5p2yOfNr9KzaBhErYFccLEZzyQXD
	VMRq/gFw1W1Kv4ZAT0NRjTLMtlILe5RCpKPlABW/EzhlQFSjE2LXYEBHNHK5Rk8wJ2g7+vg/Gsv
	e7aCqMuQE3kb295Q==
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr422782571cf.0.1777285855441;
        Mon, 27 Apr 2026 03:30:55 -0700 (PDT)
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr422782261cf.0.1777285854850;
        Mon, 27 Apr 2026 03:30:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046223sm1097310966b.49.2026.04.27.03.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:30:54 -0700 (PDT)
Message-ID: <5522e3fb-4140-4c64-9ff4-f0897b85cfaf@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:30:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mailbox: qcom-cpucp: Add support for Nord CPUCP
 mailbox controller
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
 <20260427005236.230106-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427005236.230106-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UBzOpYSkPJxSNNWnFBlT8zCajT6iI0si
X-Proofpoint-ORIG-GUID: UBzOpYSkPJxSNNWnFBlT8zCajT6iI0si
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef3ae0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yOHyN-RScyqsYvXzJDoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExMSBTYWx0ZWRfX4FUbfcwi0ihp
 oofu99YbUrD4z+plWuTKUx3ll43g+9mijjFEtNcNHEuUCMyW4Jft6xLlf0OSaiXC8W0EfvKBmpn
 7oPWKw6QX0bP6oDX9Z1RaTRJ3YMvR4Uw1GisAK8kN5y8EaOLATbt7nvn5BXLjmwvAnnS7PNTg32
 JkK7bq03nBSeuPPqCgsq4F1CcRlbDXgfuix4Mm48oB5zpNMJ7kgduxSwUB+/8BM4XZv8vEOZD2c
 g5GoxhuO3JOtBiZQyFfsERLbjRNA+al3d9f+eySAXuM4NhJi7Ix7PnuGbEP7SVUZj9bZNkeC1DG
 435IA5jjvO8ydLiybvKNohBhb1MOolbpnJWjUmPLSw1iWA70cR5it66r2UXeFNmWrLWRqav+Tfb
 jtuP+87TuEmFiPH+aYteG093LNy7OB/3Kyw2g5zhlSsagbGtwQzZOsm8/SSvlvMftxuYe3c7vzJ
 to9SHQSFHVPlMZmf9Ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270111
X-Rspamd-Queue-Id: 725044710B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104696-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 2:52 AM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> The Nord SoC CPUCP mailbox supports 16 IPC channels, compared to 3 on
> x1e80100. The existing driver hardcodes the channel count via a
> compile-time constant (APSS_CPUCP_IPC_CHAN_SUPPORTED), making it
> impossible to support hardware with a different number of channels.
> 
> Introduce a qcom_cpucp_mbox_data per-hardware configuration struct that
> carries the channel count, and retrieve it via of_device_get_match_data()
> at probe time. Switch the channel array from a fixed-size member to a
> dynamically allocated buffer sized from the hardware data. Update the
> x1e80100 entry to supply its own data struct, and add a new Nord entry
> with num_chans = 16.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

