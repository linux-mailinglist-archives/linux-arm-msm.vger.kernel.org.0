Return-Path: <linux-arm-msm+bounces-80807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA768C4130E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 19:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEE013A35DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 18:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D8A307AE3;
	Fri,  7 Nov 2025 18:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YF534zwe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvcburI6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A92C236B
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538547; cv=none; b=Oa9lyl0jhAVu3rPqHL76I9V29o3Al7TNhdMhMmvYFBK/ResTeKto2l9+BPAzKeOpuluLeoCyCoN0g2zajWUHUtzCTRqNwjCVfo22uBHSUFcrbMH4JcWJrPAyStK+Qu1H6+ug0EhTFpBuG8tExM5o0mh2l2L7SDzXzCaUuNhcVCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538547; c=relaxed/simple;
	bh=RtmWmKUAx8o7BAXtIJLo0XTrvGpOfFcDGd8YP4rIr2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVbGPuAlKaFW6T9kpDrhF5opREgS3oWNVDpj+mia+yB/Zga//JOJ/fsLvRh3dOX7sBCXU7UxczqiS96oofLMINn4adXlKeWhAD2lEARyJfMglKJlU7A4acDy24SYshNkG8/5FObhFyR4h+TJNCi+jwxQDZF+NFJ26WfNHMT4z+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YF534zwe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvcburI6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7B5G2F3175071
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 18:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEX2bdhiiRDwznBISb3B1B9zQtcThm0UsQhBXMVV7k4=; b=YF534zwerOasWGzn
	WvFIXYlfKBM4vSAPhixHPdOeTpvuQfVtNYCGvhaTWCB7mTaXIEVvlXEP3/y0AN/7
	CdJLyuM4D4FxbV475biUahILF+teYxgzULAJPwX/idWYpGZSkSDuTIn3hUzcIq7c
	QjShoyL0zUY5u0WK0bVNrzPBHCP7KsiLStJClQ3RrUkUfF6uPDSWNJt5tkiTWOqd
	UdCnV2OZol8zLb46s3YofkcG8iP+z4qXi/MegVpkNaHI6+Q+7OIbCWJx+6I+zfXI
	gC5N+wqi64Fi1vet8gmiOYu0u/5Yqt0iIECzYK1jTLQWIsTgT22BKW/jj18vXfuj
	E1wEjQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9fk814uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 18:02:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ceeea4addso1133166a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 10:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762538544; x=1763143344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NEX2bdhiiRDwznBISb3B1B9zQtcThm0UsQhBXMVV7k4=;
        b=TvcburI6y4h9Z4yMlzXXvFwbjDRinUIzeR48TVbpjgeXLMgjOstboeLBATjfYSS8hd
         jG4TeVMVHLuBEAFKHRD6ItwSjGhAQsVqjIdiAbPs9a7qasVVGBn95HGjsUDHKJpNl2SX
         p2k8U//Mclsx+rDslwF8xbdnsXRsFIn/vXvg3vzPjJoOEXih21GMTLUvBRMz2Hr7hAUu
         2OLCuIR5Uxt1GqvM+UsC6pl4FMAMExttLvlNqCUvTFanS3KYHqXHo+zVqBOHEnpT5wWV
         bUG+/sZokIXHfqx4hSaDVrmqyne8PToIhwzWHBpg1KLWxCAVudP3L5Uf0H/04k3Vl4jg
         Kamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762538544; x=1763143344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEX2bdhiiRDwznBISb3B1B9zQtcThm0UsQhBXMVV7k4=;
        b=omLnHa2UDNIQLdqG+/xHq5k2QKYd6FOUJbT6/SwAgKlm6E/LLoPrCW/lj7xhn9kVNV
         utRDG7Z+eSkCy7oKpIJyOXKECEgUxe30UdF/EhvvbHMpbnOwKfwgmxUPm2yBbulz47tc
         D0ISHkM4iCsovEGLJEk/EFGXOxODiX8B0PYcMK5MBGjmc4yqsdf1++tYw85JdXkw8SIr
         nCOM8GKjWdP5yD475KSR3LXLaPAQJqo696jRdvzpquv7P/PH2zyHySluVs3vUdlSkU4f
         ENZWrpPSoAh1DThpYpbmtCTPzSU6Gr/3A2CKGu1KLch4i4W3GYy+XASfMiqTjgHxhnHA
         CAZw==
X-Forwarded-Encrypted: i=1; AJvYcCU8qtqEMffgT5f4nE+8grLZzW3xmWdjj2rj92QN2csF5JDeLIIiUQZ8Zv9vpIAkgb8CjinTaZnG6potjqFY@vger.kernel.org
X-Gm-Message-State: AOJu0YwE8goxgOGkkXeJdE9u0tv3p6EsNVqgt5JFSpCpYfLu/r3jVlpY
	JVXMr69ro1+jnTYaLjl9wKwAsv60+numAXCP7+HUhrGx96IdJPHllGthcPyHicQGnPTk47w3q0H
	AG6Qyshaqa7N2Y3Sqx8+ZyPEA3THf70KOJNj+o1JZ2skxWEEEfoBGjocz16Kfg/1YFPGS
X-Gm-Gg: ASbGncv35uNZsBH+vnqxKsEqVvyWtTH2OlO1leUbyXSleUHL5xguYygZs+CKp0UF6UA
	k7WmYh4TcqdN+QuDSzqYfyCaVd5iuhLW2MpokyTHaTbnzGz/woM7R1Zzw8AbbT5cQxj3Hiph34a
	FArO261owoMr10huZZbythu3wq1vLhhkMrGO1fLxXW1tl4m8OeRXGByr7mWCXpmWwp47a4As7KR
	eP8nzlwqThkNERaM28fIoMoi0OM1uLTOp3zpvqbaunfCvXpgZ2rsh8mdl9+lk3Wuz43vbYbphL3
	lFPdvSv+jKlv40yI5CI69pmJ2+VYn/lnkdARc2HvR6drAXkQtFC8IL/ryPTu7X7Nbr/Ko9gnE/V
	XDHbKZAhJbLKFCPB+6Vbne2jUQOFhlqFonAtb8RoE8k7jgdz3KQ1D
X-Received: by 2002:a17:902:f709:b0:276:305b:14a7 with SMTP id d9443c01a7336-297c046d796mr49289825ad.33.1762538543587;
        Fri, 07 Nov 2025 10:02:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5g2Ian8ZOe9W/bfj+sZWk94MWBEZ0nF8wayXRs4eobe+EjnFmiWfUcV13PaF4PQ/+3T533Q==
X-Received: by 2002:a17:902:f709:b0:276:305b:14a7 with SMTP id d9443c01a7336-297c046d796mr49288985ad.33.1762538542753;
        Fri, 07 Nov 2025 10:02:22 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650968253sm66147185ad.20.2025.11.07.10.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 10:02:21 -0800 (PST)
Message-ID: <e2f71cb5-9f8b-4f63-9a9f-923a21764e7b@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:02:19 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] accel/qaic: Collect crashdump from SSR channel
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andersson@kernel.org,
        Pranjal Ramajor Asha Kanojiya
 <pkanojiy@codeaurora.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
 <20251031174059.2814445-4-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031174059.2814445-4-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ttiXzKgAF4SmWpBd3_MUeqxw5X6lL8q4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE1MCBTYWx0ZWRfX25QlUMuXosQE
 5bHhnBvHUHdloH7vNnJ5PwzrcQbsBG1hn70aKnebyPvmHV+Z0DL52OX30z6J5bVYY09K3eyvs5H
 fuu6nxq6ewtd/9nkl4AotIVnoqqSXmq9dgP/2hlWiJWx4X6h5i3k7TYf5Z2XFU5oJpM3/ITT6Lr
 toAvuWs80eaWiRnT7N1TQBYi+efvINOidX8y4YlAI0ir3uJHNf4NrwQwnOMUNrp2N5ksFfE/Is/
 Ivm20dEYTm9kSG03qeq2MuOJg297PId0Y+j6rmRvykN4S6a3HeqYKs7t3ic/7EUzHyAT8xefsKh
 gOj164+xlxcg6kDeAOQjnfX5GTV7luqdMdab842lE2Kb1OdXl//kPkNnDcfaLO6iUpFR7FR7EUS
 0coHnexBjWCMw3RYz87w2qKdQf48hw==
X-Proofpoint-GUID: ttiXzKgAF4SmWpBd3_MUeqxw5X6lL8q4
X-Authority-Analysis: v=2.4 cv=CPAnnBrD c=1 sm=1 tr=0 ts=690e3430 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=A1UfY7gyCxWr6ct2WGEA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070150

On 10/31/2025 11:41 AM, Zack McKevitt wrote:
> From: Pranjal Ramajor Asha Kanojiya <pkanojiy@codeaurora.org>
> 
> After subsystem of the device has crashed it sends a message with
> command DEBUG_TRANSFER_INFO to kernel(host). Send ACK for that message
> and then prepare to collect the ramdump of the subsystem
> 
> Steps of crashdump collection is as follows,
> 1)  Device sends DEBUG_TRANSFER_INFO message indicating that device wants
>      to send crashdump.
> 2)  Send an acknowledgment to that message either ACK or NACK.
>      a) NACK will inform the device that host will not download the
>         crashdump
>      b) ACK will inform the device that host will download the crashdump
> 3)  Along with the DEBUG_TRANSFER_INFO we receive a table base address and
>      its length, use that to download that table from device.
>      a) This table is meta data of the crashdump and not the actual
>         crashdump.
> 4)  After we respond as ACK for message received on step 1) we start
>      downloading the table. Use series of MEMORY_READ/MEMORY_READ_RSP SSR
>      commands to download the entire table.
> 5)  Each entry in the table represents a segment of crashdump. Once the
>      table downloading is complete, iterate through each entry of table
>      and download each crashdump segment(same as table itself). Table entry
>      contains the memory base address and length along with other info.
> 6)  After the entire crashdump is downloaded send DEBUG_TRANSFER_DONE
>      which marks that host is terminating the crashdump transfer. This
>      message can be send in both success or error case.
> 7)  After receiving DEBUG_TRANSFER_DONE_RSP hand over the crashdump to
>      dev_coredumpv() and free all the necessary memory.
> 
> Co-developed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Co-developed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <pkanojiy@codeaurora.org>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

