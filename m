Return-Path: <linux-arm-msm+bounces-102405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN61KuQn12mYLAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 06:15:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFC43C62A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 06:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90AA6301BCED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 04:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F5213A3ED;
	Thu,  9 Apr 2026 04:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4nF5jMt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxqC6j8B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BC340DFCC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 04:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775708124; cv=none; b=SGXK3I7ZYj1PcvTLNLVoUYODSMeqXpTc6+9qVvSchOZXCGG4fHucMBE+meZjZHQuNdlnioo22PKZW1AJ6Sj9m+H9clG15xT86dEpemJseM6ZTxmD88Xv+LFxa5VfXRU52CRUu23YvVByFUF8iMWqqVYzP05toJ5bGPBlaXISvQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775708124; c=relaxed/simple;
	bh=xcM7TYtOdQQWWW6utBXDyke3h4LT5QOMSWQ6XwP67Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZOG7Ae4O+Hy8K05Q+1lD3XjSG7EyQ2UiANyX159WIraqlHeaEz9UxreGtf00dLwCMASSHoxrT5rvhB9F7DTxteOGT/aZc3iiVeDas0ZVNzmuilDg5TH/br1tpLJ4ndqO/xE3Zqf8wcpfVGdiyIz9+Gq1TyTVm8fRZwfOwAiiKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4nF5jMt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxqC6j8B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6393CLrN1727432
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 04:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1eDqQSPk8E5KTQI40a3DvbWRJFPZD0z6DXQp1BfF2s=; b=H4nF5jMt7EMS6wje
	x5SX3/0ZUPtAfAfJuiMOWtKILhzeEha4dsNvSJw7dMp9R6nYvhZIqzoKjQqpaMx8
	tiEioC3c+dX4TO4fszbq7ee80wAqSCjxCq+kZzzETes2zavnc8eLC+eLUBCvQe4C
	FotGz2PjFjm9VvE9gytKnFkphCUIHKVBUBsvXSeoMmObCBwJE1DqDVMKpqzsHHei
	iMEK0v67knQMaX7sqJqmP9QpvIQu4FfwDFm6f6qydGIRVOASdjFwzUSm3ms8RsAM
	JKxbx3hf21tOVAUWy24bLOfUm63NTRxuXnGNDsGvH4uury1jPD/+lCa4GcNC/m65
	AMFUhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrsfw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 04:15:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24af7ca99so9260555ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 21:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775708121; x=1776312921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z1eDqQSPk8E5KTQI40a3DvbWRJFPZD0z6DXQp1BfF2s=;
        b=AxqC6j8BJaKmAFTkbP+xIGH4mwpmJBmjA6xT45tmB7CyCcdiKh8WvQKUFRn5jspLag
         Xxu7HLTGmz+rQYkAMHu9hFD9FPs+XG5ZI90l3Q/BweDvdB1JyofcjYy3314eU9LpCj3S
         0hXMp5i3f3lzZjemOvWzDBoyfzfUCljIWVGeY8Ra5mRbKmXQW96TsnBsQsltehgK21a2
         YVneevv4sYHKTJDWEwX476tO/FB28O5zWmwv0falxPCLM8UNMhlP2739OtE/+BRZLfju
         h7x4dZnfq5JYPtoQAMcluLiqrEYP3IGJRslYAUSsWcNTg7SqknuXvLPbf2tqRpaswoFj
         joGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775708121; x=1776312921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1eDqQSPk8E5KTQI40a3DvbWRJFPZD0z6DXQp1BfF2s=;
        b=MOjkarwBVxqj3RDwhFJ2tn+4/ARbEHopcOa3NaZ/OStUC96WnqWp25B/KYr6AVWPJD
         nYb2HLvt2SxNIZ9E8NSxOjX/0xBVCXKrsGoiXMk7ecF2pcLvMwKsdNj0aqWXuWQ3rHFD
         kU8At64zsKgvuBIqwLEV+xgVsKsWdY9fQSTUEQqDGIVai6TeKPaelQhONj40Xn+9NmQa
         vGYtI+Oj3eGjIYk0pSiBVPYWuYxLfGMaixSQ6iNZVf4nd4Kt2JnRlkKo5nbesqEhcTqe
         n0+skD9vyCYN1blETA6EjNBLu3RoR2hP8su3FfCn6t9r0sj+IvsVvlCIDZvUqLPR7Q2x
         ti2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcJesOxwSPulgQiqxHM0nCYEwskeWrEqtT96ZOSVzkiDaxR1C6GGKfxqm96/4otHrFfvSYsgiYxsqh+hK7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8GiKpPtaDjD+uHctY1umcuI7wgJ/if2qwSoMXQmWSG+9H6PX4
	J2swW0N0j/buiVj7rnvz1q66wPhz8dSzGfvTWNFVAoXTQ81qlB4k9s4O9A8691weJNeHB8xhOZy
	wdvwb9mn8GboUYlDw/p5cGdPVhKlcmthvhT1uhcWszQrQEd4NaZbTCLmm+CnfJlRwkzuz
X-Gm-Gg: AeBDieuKNJ8N7Ul0Ct9cxO0L3g6vA7ssIyhgDD1fyQQpVR+mk4yIIPkLIzEthz6x40n
	75zh3jop2Wj9jVR96DmzX1g1HkVQESjV/X7NmTKiljBtw+C9bA9yTdmgkwrQl7oi+s7Kfd21NUT
	QlHrRWaGRSoWROeByombq/AzYzaqsdkXhylPMkOgski8NNQWv/IbSul2Vq6sSB2KeHa2mW383E+
	Vl0RwENCosAixOa7NsXMd+oFGo1HErB8Lz/I6xzeM/G9/ABZqV0gp8WQ1GmAMgJhvUynOS3Lccv
	mQF0d9+WE7d6UIQcK9zMvLWXuNt1bYpAt/w0Qcwuw15oWiZFUL13wj4qKZKUXG9CFTwKhyxD5QR
	ixHfhvZQiOlMjv2XdoDIuUKaYC6zyEy9Oi8FZrymIbffh9v0ngr/S
X-Received: by 2002:a17:903:1b70:b0:2b2:4029:d77c with SMTP id d9443c01a7336-2b281763373mr265628345ad.23.1775708120983;
        Wed, 08 Apr 2026 21:15:20 -0700 (PDT)
X-Received: by 2002:a17:903:1b70:b0:2b2:4029:d77c with SMTP id d9443c01a7336-2b281763373mr265627955ad.23.1775708120443;
        Wed, 08 Apr 2026 21:15:20 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d098sm211355975ad.13.2026.04.08.21.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 21:15:20 -0700 (PDT)
Message-ID: <5f58a4b7-312a-4cf7-b920-401bbe757e3d@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 09:45:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add QCrypto nodes
To: Alexander Koskovich <akoskovich@pm.me>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260405-milos-qce-v1-0-6996fb0b8a9c@pm.me>
 <20260405-milos-qce-v1-2-6996fb0b8a9c@pm.me>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260405-milos-qce-v1-2-6996fb0b8a9c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAzNSBTYWx0ZWRfX0ij0hbGYNSij
 UJp9HccbS49r9VlZYlT/m9IAJ47qwoCDQzshA6gQ57o8VRqrEgGAY/pst5IBofZMawMBP6a6lt2
 7PWoImX2H7SlKxbaIRi8DeNLGG14R9SMCEBT1BKJNSlLovYvxwVaHdGu7+lstV2I6Nwem3ijkxw
 Xyt1cqOBIil6SSLXWMPwdhFpE6yHZG/KLW+9KTLYPqjFHlD+v6mo7rViQdbFqMRr3igbmOWLhWx
 Jm430fz5BthW7wOCS81DN8iPx+swCxAx3feu2DCJ/20uvdjiJhfuNRpTIEgOCbTD2vdCcGpnpFu
 GWK/oMxvLG3E7WOMDrTodPNEUilFBdNIpSl+ISr7KI+ix2PfBQlp0g2ZikJPC3O8kBPoX7BNF2d
 s1vu03qQ4noOl32Ji+3wp9n5tfhI0z7+ul9eSuVN70OdT8Q3KwTmOwIUFfLPT44Bz3em01RlP3/
 AHibuTazlIYBMr6PXdQ==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d727d9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TCpjqbDHjloqY1tG7BYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: iOGtlQ8OcfD5bCBqaxU9sPZPF7HaXKnM
X-Proofpoint-ORIG-GUID: iOGtlQ8OcfD5bCBqaxU9sPZPF7HaXKnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090035
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102405-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[pm.me,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FFC43C62A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/6/2026 7:40 AM, Alexander Koskovich wrote:
> Add the QCE and Crypto BAM DMA nodes.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


