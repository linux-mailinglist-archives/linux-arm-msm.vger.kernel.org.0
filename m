Return-Path: <linux-arm-msm+bounces-93437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPukG9l/l2kOzQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 22:25:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA72162C34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 22:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8ED93015D18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 21:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706AE329377;
	Thu, 19 Feb 2026 21:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcgqruqB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdWbcu/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B4A2405ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 21:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771536343; cv=none; b=kTpfRukRMasla2LYaYfFKepFPbtFVg6d5XYpconcR1iohZrfFapYjPy6pAszgbUZMmK9ihOgQNPPLn7PS3F+x6tUhGw4Jp53820ORyM7X8AWR5IMH6oey700pODoN4cJ2DYeNH4lJU+pr2R4DT0iiLPszfioEllPy40rPw++K6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771536343; c=relaxed/simple;
	bh=jL5o7GFTmugEcXq2ui02VPU/1+FwYLCcWIC8F9vnZHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAhpVovrCoEc3zp2GjLTuW8XhGJU6Txf18resxZqW/ZemFRROViik71a9NIdfeSZNiJukyFUyLOk5ywAMIIaffgkLpfgb+gNidN0d2QHkDBOozLRV3qP5p0CoJVr03fzsLxYLM2RJKYy0DZvF3PfBtl+jm21nkwcrwDi+j6NdE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcgqruqB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdWbcu/e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JJRkWg3564289
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 21:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kB8rK2ZPQwwyuY/8mrVa4LKU+9IjuHU85pf2Pkg6JGM=; b=CcgqruqBhDF4DmBj
	U961qpivyYUC4c43YJ87fzFdzJW/K4UcXFTfVdt350VDvcbStDpQE8v9Bq8E97AU
	wG9QrsBdU0h5/NdvJpUtwMsIEr20Z8htOFPYMIG8G8/VsyNiy2LKwYPFtJpZuZw/
	wGePOG7pwsBNpkoO1UHCUr3LOqipjap3vaeRQhVEb6ihuLjGF9bnek4Y4w8K+UTB
	xxJzB3CzbA2CEPiVmX6MFM1KUaWmkfaOLQVdeVk6Smu1jBAHy4Nut0IUJ/jeGJUY
	+IulmCQByThQGD0jrtOOs79jpiD9+WVz5aioZRJk4BoeqSdYIs3cUmqtQWTH3pXh
	81KbLw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce1k81tgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 21:25:40 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127133794b6so879588c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771536339; x=1772141139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kB8rK2ZPQwwyuY/8mrVa4LKU+9IjuHU85pf2Pkg6JGM=;
        b=jdWbcu/erJIA1ztZ+Rzxs/wLT2mphpbRWEUu87XT0L8DxAh0Hx7UA3znvmMnmPSWXh
         KUroDQKSQoqXoytk7BouPEDOaled3xEhkw9umBVceIZarhqDZwHx+V1eNamdo5sQnLoL
         YQjn1eIZ9rdCokQLF6f2Nm6ygpLL2+fE11KwlgE799goUmDAuDW86zeYOLDKvm1iAaNS
         KgIPEWU4AZ28d3zswXnGAo7EPirfyI6Gjzl3qtzdNPg7kSxmb3Nv/7Ot/a4VbUx8L/Ky
         6cqmcjYnOSlpnhLI7+iCU8BxSzVLcmOkfMaSOkpBNmbH3vGqjXFWrowC2Ln5rIbNpcfb
         7//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771536339; x=1772141139;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kB8rK2ZPQwwyuY/8mrVa4LKU+9IjuHU85pf2Pkg6JGM=;
        b=mzFUGVPbRGs1J1oDgAwmvqZJrX/RCoqchIy6vODoox9cNXgZFsIYIN6Q4KAzU8gLB7
         GUjzsPwWkqyElUHUa9Bnww6c9B7RArZJfJBO6SOT/SHRddTOJs6NqfFdyvboy2qG4vHd
         zd+7Garxi4GImLyqy/xtIh/OVY7X9IXmF0QN/My7M07wKSIE/jacNyvcUGuGGQHAQ/kk
         3m400Qe5LrHdbZ56mNZyVvOBo39iO6rugBoKMA8r5D9jJiuVMhLpnhS7AXXjnLAeeEf0
         4kj9F7aj+NxMTZAgZno0tJZXZ60/DPNeFzTm2at+HHakaEPZgGDUAJ6DTZQwvaorYecv
         mUGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVqtc2XlqiNbmNcnR7nmfxwRYlaP0Y9o2X+q2VbIZIhEgP2HvGcluh5ykcZwzNSmJZePPtHMba01EMhr0S@vger.kernel.org
X-Gm-Message-State: AOJu0YwqT4RQGzphxHcU0FLL/T3zqGv5IWOO6gzrsIVnmk53pT18Mvhu
	H9+pWKaDSedG1HKb5lzLGvw68rOFHtFrtPDffkusX6EhpjB1u+BP4ezoS2qY24gX2FFOikCygyi
	pq7Q7p0hsAwoT4PFG+exf/OBFe79uXi1XL1tPu7U2n1jIQgVZ/6h5pRMcmFBwSRzl32SGoG3cu9
	Ck
X-Gm-Gg: AZuq6aKrYrXhVgdFkHTlWkcUerOjWOW68frCNrsnfmH9DLfrAJeEMS406LaB/zltz1o
	4N9d4igZBNbamCHYuZAXsnyXtLkCaZn7KyVQiszlS7Jq0VbQRYLDhW5W3cMaRxKBK+4/fEGPc/B
	J/1bSZssV2bJXSR3oJzhl2VORle6IbD7ZRUQ3p2ZN5TQ5hGLEKeUR2HGvB/Ax1iioKPvnwfPnRw
	ktcogMGAJc9+7RUetpj3im7LyAzPFzP6q7RuT+Dkw4YY2JiFacZTvY8JRV0bu9TJRX7eYLHWuUj
	betQPIT0EVBHOsFzM7Is0itp8m0RRrr0HgE5AsyM+dbZXyUeDmbt3f/j5WkizlM2Kz/1dbDKZgu
	8amkLYQJuPvGoJbl2Pazxo+ZEJ8SaPs2NCeD2CAUGMK0Z3QmmpoZC05CuY6hwyPx4DuP+gNdLOc
	vLNZ8gn6yFxYc7fg==
X-Received: by 2002:a05:7022:2510:b0:124:9acd:3bd0 with SMTP id a92af1059eb24-12739790159mr10632459c88.5.1771536338976;
        Thu, 19 Feb 2026 13:25:38 -0800 (PST)
X-Received: by 2002:a05:7022:2510:b0:124:9acd:3bd0 with SMTP id a92af1059eb24-12739790159mr10632432c88.5.1771536338383;
        Thu, 19 Feb 2026 13:25:38 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c6430asm24324381c88.6.2026.02.19.13.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:25:37 -0800 (PST)
Message-ID: <1ad37b2f-5f3c-493e-ba3c-fec1a0377767@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 13:25:36 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
To: Bjorn Andersson <andersson@kernel.org>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Jeff Johnson <jjohnson@kernel.org>,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
 <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
 <q2gogah4suu3nftewye2l3iud2nxwdi7ykzqnagnz7npmrurgm@7icn643kozp6>
 <ke3anvhgm7popzmrh3eg272eczhtcmgtho6trkwleczim23lcd@dnaudbsrslhr>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ke3anvhgm7popzmrh3eg272eczhtcmgtho6trkwleczim23lcd@dnaudbsrslhr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DvS_wgtIGEPZ3aQJTF4dQjb5TOgl-y6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE5NCBTYWx0ZWRfX9bIb+YuzqOe+
 6guGJ7IpRhzM/pUoH1KFvIlNpG46zQQ7RFP+oqg+LecCu04p9pPMSMOP834agt1Q6xN09a5Qes1
 LYxVaiXV/Vz7uiguy+bXtswDDzWawxx5MUMLhumryza8AQ1Ms39TE8PyPdj3L8k553IM80sa7rI
 S74wsVRF3tVAtJflAMSD17+5y9lnck43+OVcjRLOVLWBj3iZ2kGqj/P0JBn9l0TMgq6CxL3KTS0
 nq505o+Y4ovnyKNHGzxCWEYMKWPWp2xz+P1yRVPOKM/Gdqh9cKknMedCKuKe0isQfDJzOUY088B
 yk13Z4YRse8ZTSZ9O4aWbH6VoB3DkpH/oVWZ3DrGUfBTNFp8Sph17j1HMubZ7qLLE4hfX0hWaFb
 l553kvDDMlNkXcLSJLuWhqwgx/Uv4/yo7CE3eYijDuccOVSkpLn2A6uIXnSKTB6MMFeOL/BNLBk
 Cb0GaHz1Psf+Qx4Lu2w==
X-Authority-Analysis: v=2.4 cv=cdrfb3DM c=1 sm=1 tr=0 ts=69977fd4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=btePvF4m8IT5Eud_TlQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: DvS_wgtIGEPZ3aQJTF4dQjb5TOgl-y6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_05,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190194
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-93437-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFA72162C34
X-Rspamd-Action: no action

On 2/19/2026 11:18 AM, Bjorn Andersson wrote:
> I reviewed the downstream code generator source and documentation.
> 
> We do generate tables matching the ath12k c-structures, i.e. variable
> length arrays are always prefixed with an uint32_t field - not a
> uint8_t or uint16_t based on elem_size.
> 
> Looking back at the original implementation of the in-kernel
> qmi_encode(), we only read elem_size bytes from the c-structure, but we
> do so into the (little-endian) uint32_t on the stack, from which we
> encode the message and act upon the result.
> 
> In qmi_decode() we decode elem_size bytes from the message into the
> (little endian) uint32_t and then write 4 bytes to the c-structure.
> 
> 
> The fix would as such seem to be to just update the length fields to be
> all uint32_t. The problem I see with this is that qmic [1] is the only
> publicly available code generator, and if we change it to always
> generate uint32_t length members, we also need to fix the
> encoder/decoder in libqrtr [2] - which will be an ABI breaking change.

And IMO that is a deal breaker since it would break the interface with all
existing legacy firmware.

> 
> If we go the other way around, the drawback is that we no longer support
> the c-structures generated by the proprietary code generator.
> 
> Worth pointing out is that the structure of the c-code is an ABI between
> the encoder/decoder, the code generator and the client - it does not
> affect the wire format.
> 
> [1] https://github.com/linux-msm/qmic
> [2] https://github.com/linux-msm/qrtr

Going back to the original implementation that reads and writes a u32 on the
stack, can we stick with that but add endian logic that correctly converts
between u32 host endian on the stack and either u8 or u16 little endian in the
messages? Is this specific to QMI_DATA_LEN TLVs?

/jeff

