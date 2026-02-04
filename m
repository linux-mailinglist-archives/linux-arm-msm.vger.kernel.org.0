Return-Path: <linux-arm-msm+bounces-91766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMfuNSzTgml5cQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:03:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 368ECE1A58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECBDF3020D6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 05:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941EF35294E;
	Wed,  4 Feb 2026 05:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWoIrFX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjYUvQll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A650350D60
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 05:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770181418; cv=none; b=jQws59jT5Yq9WCQqNG6HcN6yjIuk5BmCIOBXtZHlLHRzrQD8S32bo1Dy6clJ28aX9J0/Fp2dzSHLvkgWOhsS+W0uwCDdQEa8hCHTky5RKaEGVJC37Ff9oyWW7xdEmKFs7RHGnGoRWg5v/yTxS8GH9rmJnA5inHsu+Pj0Mj5nDgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770181418; c=relaxed/simple;
	bh=k99C9FE5ISObnsVu+gs/HeUvfmWmzcZd++zK+3hMPGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvGDTzwqPiKZsEw6VQaPAITdfI9Esms42y4qwXPUbTzmxPYunuQIA+I5AwGn/VV0/ZgteAMVKgG8AX12yWfS+Y/QksOxsyUoaVRB9DE/KItfh7XXaxNlIzan85cmT7sQ7Y0tzjnpvZ5luQGIMEj+W245m6q4hnSnbFbyM5rAKr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWoIrFX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjYUvQll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6143iBhx3337443
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 05:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3S1EWXoW5T8s5YGrNj6koiV6KanW9zF/vJ6e3niouj4=; b=DWoIrFX53M9r19Gs
	Gr8F+SZhoiBBTo01DOe/aKIz8MNnRYAGeXjPO+vnKgWhVn6YhxMIbgRWb17mi/Sq
	zsRn0xX5hA2OYSfNFoK7k2EV9pkGcziHX1YUlxVr6Ip32NLQOKj63ZFAkGUNiGHX
	9eNdrA9kmV0cNlHO4SjhCcGFAxp2rs6rp2c15mbqglXbGtPgNjWCZxyJavjvZyqN
	a5/MrbYLpyPOA55A9wHr+VOmsg64ZQHnKknGNwsXdMKPQnH+0Z7PtqYsDdZRfp/l
	tsx/frnCYti12asTVxYOvT1Mg6+V6ArUXJvPTpCE9V+n2DwMndWtiBhL6k/Elvvs
	luC/Fw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gewb1rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 05:03:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82317005ee6so3346511b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 21:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770181416; x=1770786216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3S1EWXoW5T8s5YGrNj6koiV6KanW9zF/vJ6e3niouj4=;
        b=CjYUvQll2tBsDqtXdzvs0KRBU9w6m8DXNcWm7zcAuL7byEU44xvCzZA7845as66Bxo
         xAPX2oXZXUfnbpEt6j4BEUcBhLlm6JaYjOK8z3SbNODRmRlcPcJGeNZ5a5X8BVXcz/ji
         xT87s0afzAU35eSSama8eS9kDW+8/aWMB3M6K8ZMDXpr7Ro/fLHKqfCfWPC2AsXIVN4q
         Yd0F7JO++qq5e6k/DeoACtDdVZTTDT+xzOleOJHUefQQsJlRy9K7M7rpSfd871Y1D9Ft
         FzLiZhnGVVJUyi8e9uYoJhYsSkOCSPu/kNhOeLT2T5LhD5ub94/xbnK/5p9OkkXaFhNO
         ow9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770181416; x=1770786216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S1EWXoW5T8s5YGrNj6koiV6KanW9zF/vJ6e3niouj4=;
        b=tYrQ2xqxpVA4kpHFffN7hjAt3CZfyzxRrYRfWTkuZVtpS30bmREpskXNuYCeCj4yTO
         LR8lzSJ2+J+jpUlLhFiZ/5lz6TRQnGSP5aeTybMArsYeeRxBxWERvJ/bBAyRbVwuLF/0
         Z3AapnNSSw20DLuGxuvMkKXIiidOYt6sQyNcA3GVX1mf7hS0Fa7SgLzcTiHQMUqBrfFd
         Nv1gph04I9LQTAzyojyZa5lmciZ0Ge6eRHREIWXjVCh2/ahFNg0o3Fwnv7iWqad6FfHw
         eVTjr0CYjLZ2h1sHmh1Sk7b1IEBy1KNxPzcVrCIZsBCya8RV4JdJ/JwKeH6Xuk2ZNzUV
         +MgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSSTPUqwufJ4XG2wgzzjz+aAaAPqX7on9tjLkPUH/FuVNf9/L11F3wsDrCzqsxbOuY5lLpBKjMN3MMALEF@vger.kernel.org
X-Gm-Message-State: AOJu0YyPl0GBFxLkFMrfO9XedrbagFPQin8uITNPEkUAPnqj/C28Fllf
	BFTBNup+y6Iblzkfw9vhz7hioDmbgAIrKMF9oorgl9KVFapSjwCtSK/VEKRUptff1MQVzoDMXO5
	awobwN1LwzAe/Zt8/0I5oDAjLSMwOrGERHBftSrsXCF5doz8NWfOlDrtlzIQSPIrQ55YW
X-Gm-Gg: AZuq6aIWFwoTgJ2AmIrO8WKF9AankheUTyLqHA6BHUt83s1AjLEKI86l3aIdFbP49+U
	+xq/cTY4mfmrL4S4yjUNxrl1Xmk93AEH17h6CFNpjTJQYhQ0CXaoVveHJHYO1JHzpGTcCosxfTk
	Vgn3I/hAWt0C5LKfgykVpjO27YuZCOZ3tvECJPa0QfoVkeP+lspgC27jG3aL6QUEnZmH+GwA0rw
	hEqx504jDA451zIovYjaFOISQc9de7zbTXDg64mNn4w3drxQk5VUURrMImnz+rbapIbDyd1DRqU
	9c96pBOjWv8PYCUV9dHRiHZmgm+2cPHzboDGGRf4OykpGjjLWr7e9iGiBTvmjcM2H5f95pgc2Nm
	+BPmx/B8+voT9EAuiJD4/oid9MEsXTNTQHpVUEE1XVXmf
X-Received: by 2002:a05:6a00:39a7:b0:81e:af19:34b8 with SMTP id d2e1a72fcca58-8241c5f6184mr1753682b3a.43.1770181416024;
        Tue, 03 Feb 2026 21:03:36 -0800 (PST)
X-Received: by 2002:a05:6a00:39a7:b0:81e:af19:34b8 with SMTP id d2e1a72fcca58-8241c5f6184mr1753653b3a.43.1770181415529;
        Tue, 03 Feb 2026 21:03:35 -0800 (PST)
Received: from [10.217.219.53] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d48789dsm1008320b3a.58.2026.02.03.21.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 21:03:35 -0800 (PST)
Message-ID: <d9313606-6a8c-4109-ae3f-dbcb46f54019@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 10:33:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] net: mhi: Add support to enable ethernet interface
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
 <2sx75x2v24o23hlhvl3cfem4npzejt4k3dmwnaqgxykzrr7kyg@g7k5fp4nr4wy>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <2sx75x2v24o23hlhvl3cfem4npzejt4k3dmwnaqgxykzrr7kyg@g7k5fp4nr4wy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sF9SoMb-p4mU5l9ZFT8lnRcg_0vm5_Yt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAzNCBTYWx0ZWRfX7n8rYt2ERymK
 /dGfCabHfdDPp9jXKygKu2kiCQ+LTYXMNHkX36f2uWLAyHmzEI3xGYrpJDKtczY9PrZkJpchI3R
 1/i23PjNIEhmoxZxfBph3rQYXEiRMS5zXNDxgBAvCLxWj3pzLzvPPxWteiCL2h6KlzQVW29XNNz
 fk+hX3vJ93v4pisp7wk9qoWVMhk9vSgzAS42k78R5owG15KysWitOq+tFnKI0ppqRD2cyP7yrdi
 OQs1IcoheQkQjnFsE0tjaXcm1nmdv7JUGHVVaQSzkTpz8RPH8cX1q0bYY+ERw6/OVuvXDErSEfB
 63hNNDIvA7cMkalj/zbAAuSnntOGnjCl1F/zgLwCpMa3GSkioA21J94Pj4kVz824PhcSUdQd4Cz
 wHrOCYVfLMk2qh/zZe8ZtMLrPeaq9BEo8AMvRzHPrPhOsigZQEWk3oExZylHipmhQ8VsHBa+bwJ
 OvqyQYf+vAHVsedHotQ==
X-Authority-Analysis: v=2.4 cv=XI89iAhE c=1 sm=1 tr=0 ts=6982d329 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=BYBcVbb2VMsx0zYavC8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sF9SoMb-p4mU5l9ZFT8lnRcg_0vm5_Yt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91766-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.pernamitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 368ECE1A58
X-Rspamd-Action: no action



On 12/24/2025 11:33 AM, Manivannan Sadhasivam wrote:
> On Tue, Dec 09, 2025 at 04:55:37PM +0530, Vivek Pernamitta wrote:
>> Add support to configure a new client as Ethernet type over MHI by
>> setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
>> interface named eth%d. This complements existing NET driver support.
>>
>> Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
>> M-plane, NETCONF, and S-plane components.
>>
> 
> You did not even mention the MHI channels added in this series.
> 
>> M-plane:
>> Implement DU M-Plane software for non-real-time O-RAN management
>> between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
>> models. Provide capability exchange, configuration management,
>> performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
>> R004-v18.00.
>>
>> Netconf:
>> Use NETCONF protocol for configuration operations such as fetching,
>> modifying, and deleting network device configurations.
>>
>> S-plane:
>> Support frequency and time synchronization between O-DUs and O-RUs
>> using Synchronous Ethernet and IEEE 1588. Assume PTP transport over
>> L2 Ethernet (ITU-T G.8275.1) for full timing support; allow PTP over
>> UDP/IP (ITU-T G.8275.2) with reduced reliability. as per ORAN spec
>> O-RAN.WG4.CUS.0-R003-v12.00.
>>
> 
> Sorry, this is just AI slop. Please describe how the newly created interfaces
> are supposed to be used, relevant tools etc...
> 
> - Mani
> 
M-plane:
YANG model based interface aligned with O‑RAN WG4 M‑Plane specifications
over TCP between the OAM application on the host and the DU M‑Plane
software running on the X100 platform

Netconf:
This interface is used for IETF Netconf communication, enabling a
Netconf server on the ORU to interact with a Netconf client running on
the host.

S-plane:
To support accurate phase and time synchronization between the host (L2) 
and device (L1‑High), the system must exchange PTP messages as raw 
Layer‑2 Ethernet frames, because the ITU‑T G.8275.1 profile operates 
strictly over Ethernet multicast and not over IP networks. This means 
the device’s PTP stack can only send and receive PTP Announce, Sync, 
Follow‑Up, and Delay messages in native Ethernet format, not as 
IPv4/IPv6 packets. However, the host and device communicate only through 
MHI/PCIe, which provides no native Ethernet interface. Therefore, the 
system must implement a virtual Ethernet interface over MHI on both 
sides. This virtual Layer‑2 link enables true Ethernet‑frame transport, 
ensuring the device’s PTP implementation remains fully compliant with 
the G.8275.1 Ethernet‑based timing model

-Vivek

>> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
>> ---
>> patchset link for V5 : https://lore.kernel.org/all/20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com/
>> patchset link for V1 (first post) : https://lore.kernel.org/all/20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com/
>>
>> changes to v6:
>> - Removed interm variable useage as per comments from Simon and Dmirty.
>> - Squashed gerrits 1 and 2 in single gerrit.
>> - Added more description for M-plane, Netconf and S-plane.
>>
>> changes to v5:
>> - change in email ID from "quic_vpernami@quicinc.com" to "vivek.pernamitta@oss.qualcomm.com"
>> - Renamed to patch v5 as per comments from Manivannan
>> - Restored to original name as per comments from Jakub
>> - Renamed the ethernet interfce to eth%d as per Jakub
>> ---
>>
>> ---
>> Vivek Pernamitta (2):
>>        net: mhi: Enable Ethernet interface support
>>        bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for QDU100
>>
>>   drivers/bus/mhi/host/pci_generic.c |  8 ++++
>>   drivers/net/mhi_net.c              | 75 +++++++++++++++++++++++++++++++-------
>>   2 files changed, 70 insertions(+), 13 deletions(-)
>> ---
>> base-commit: 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
>> change-id: 20251209-vdev_next-20251208_eth_v6-c405aed13fed
>>
>> Best regards,
>> -- 
>> Vivek Pernamitta <<quic_vpernami@quicinc.com>>
>>
> 


