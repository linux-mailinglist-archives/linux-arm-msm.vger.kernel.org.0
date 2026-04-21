Return-Path: <linux-arm-msm+bounces-103943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE/UKi1z52ke8AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:53:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B6D43AE06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E28B2300F10C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5168C2D7DD7;
	Tue, 21 Apr 2026 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGQrkjQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7ON39xN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994033F5BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776775977; cv=none; b=O5tHsTpx6KyU1Ug41p5HDEYgecZyMgjA6UlDve9qLqEdqnnxiZPh/E+jrsIugKRma/eHnNwyuzYhhbtf3GgzJw11Pxdq6V/FSZPRtSeUJrTs1ftTAZkTF3eZCbkZ9zlvS2ZYeRaJVIxCfRMFq7wlAyPrzu+7jPFhDQqV6eETrd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776775977; c=relaxed/simple;
	bh=HH1NNtZwFd250kpA7uXnvCLzi+RUfrTgM9xUyAAcOSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bEvxi4Od7ifWqYQSSq8We2Poz4K9z2YcJY+ywwdh2nyTgUKe6VrwqraCiDw/5i4ww/CKjJcCH89cS5CiSFPwpEimcKD1aoiyzfavPdFvYY3XDGAQv/g8U41s5CYXDEzEWGgdZ5+yBmC7JK8mha4/Jjr/F6dVrl0Vdp9v5U23vYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGQrkjQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7ON39xN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9XRSC3164656
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irJi8OzHDR6ei5r/Ez62ynMGGPCuv+u/Q8dfmAXThhk=; b=HGQrkjQWlenfTVtX
	pCqIWiiEnA7cZUOjOC9uUwJQmuaKF5Jtgah8UKK007j442R00YN62efkAO80hpY9
	FdZp6fFQ0oRI3bsd36baxehwdOqJqBOvzh9NeNWXzThMhe2pVZFRzTq7DptE+uUi
	aYDD9hVfNbp1UpF5C+zC7IqKlkwxYEAheBbQ4qbeUW6D97wEbT3N1TwuqfVJA821
	l7UhC+3S7eA32E5CyAt/GAEHngk85T57Nlr5T/+bZjO8JEQa5zsyLeEWGcgmypYF
	cqYnpoZ+cv9D3iLcJTEz3QF6PnGnbxS6EMst/V/4/h6gxcGjUKQiC4bc+oIVzHsy
	VTkHVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp6q80mx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:52:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8edcc885cd3so33172985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776775974; x=1777380774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irJi8OzHDR6ei5r/Ez62ynMGGPCuv+u/Q8dfmAXThhk=;
        b=a7ON39xNPmibqz7+JShg/pM991tLK+qV0CAeDxxVp9y8jYJxeH6KId5A7q/BaaEytg
         qaR+jnAFj3BOMNKOVg1tAd1BArICGV9mtFe2ldZ3lWLlrfhIUHDA0W9jeGn4gup8Dg2C
         /6/wDpmyhgupIVEwCpXGNttL7+WGuDBZ/ngjf+O6YOJhp2jhirXFktjkLxAiF94A+WIf
         OJW5Vo9fmWkIRSBCmPXlgFccIG0/7zy5VoJgp2FpWegHJawDlzqBRrd3O4EjKXx9RBST
         X2MF3WXfhPAChc0Chr7f4mcUGZYVBzvMdDMbRQTsyictbwCGkeictp0HQGG7ZHcHVq+E
         dWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776775974; x=1777380774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irJi8OzHDR6ei5r/Ez62ynMGGPCuv+u/Q8dfmAXThhk=;
        b=fvMAPuvoNlAm6I4/jh+3+idqq05IvezA1YsYyuKpEJQpLKgEjqtQbOf+pUXRhWJZrC
         WL52SodKyv9lQmyFqDrzgimUm1wjKkk3f53v42EcGhfUpuwMzRYnno7RE4nQzHqmmbSV
         HPnL9I61t3lIVgPZqZ72kNQRf72x/hEmhqaomajdtiJf08TbRnO2HFPgCLPXuum1XE9I
         jurPEq7S6I31lCt4ECFgo/+nnbIsbjjJT9+bH1bOkD9kYwkKVnQXsWUAbrmrgtVyhtg+
         ciX2A6tatGFQl5aU9pg+NIykogAfe13hA99Mm9S5ksEaK45mMo3uVkc6W7waO/YbzL8W
         gP4Q==
X-Gm-Message-State: AOJu0YzFHnFZqxuQeb0Z5ti7SETENRbxO2wAbh5KIW2cFGSwk7N0AoBh
	++9uOytnd+gRMR9CjtfxcIzAgozwY+fs4Ma5ESdYL9vGf3RACW29Qt21FF4yeytzOMnqX++i+7d
	p2r+MU0tpubQKTe6D/xk7AjMjGghI3h0iBxXljoY9C1aiy8o9OuJBzfreFyBYPOSR+qFqoMNx6R
	wx
X-Gm-Gg: AeBDievZwcdtFWxtunk/4cHHPW78ysNnOHs5fIPXdFY36QfqJ13n/2Z3jLTKM0aENq5
	ejwDjwvT+b/iNV86a8tgXko3qlr7YNgMBBBMkYHPdx8whcFLaE/sQfTVrfOJlvoP+GDVmOMmRlA
	KKGiEmuBMQONzE5hgPdgHhBrwb9KcIHjclMi5sYbNOZjfTubQeJqg6Wq2KZJ2j8MfT41V/0NNyX
	+gaE5zasivHQvDfd+XibQWpvX764eES40csQ321XNSAu+LYZxZSjASsvB1L4SblKI0LiMfWS13N
	Gj0I6Bpyi4T2BRjhIFwsTNIj59uiNzOa70gJv8gRsJphEHHelj76pc7k7GHwkqfJaBCPCh3GWgU
	gC0vq4TXiYsIFbS33L6I4o8XM6Uf/0RxdwM/G9l4ycw6g41zW59hGTHgHuN0atyPHeCLqYbYdfk
	paBvrYRJB+4ThLtg==
X-Received: by 2002:ac8:5741:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-50e36c12a00mr165757541cf.3.1776775973950;
        Tue, 21 Apr 2026 05:52:53 -0700 (PDT)
X-Received: by 2002:ac8:5741:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-50e36c12a00mr165757131cf.3.1776775973511;
        Tue, 21 Apr 2026 05:52:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e1bsm444593966b.3.2026.04.21.05.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:52:52 -0700 (PDT)
Message-ID: <023375c1-d2ce-472e-8a82-1cb013d31de7@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 14:52:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] ARM: dts: qcom: apq8064: Fix USB controller clocks
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEyOCBTYWx0ZWRfX6VWqhQozP12V
 zFFipV1jFmTsjDvyZBVMhVLxZsdJJIG2liFSaJYD6gmB2weh5M5aAuMVLjzVmeUO8QcuY7TLStY
 88G7nCW/JlgbiJnHIYylZrLfTjiBShKDz4h0K/CB3vgE+7x8pMIzi0seslFIniiESkmJ+RUUpgn
 hMX6otB219s2E+nafdpfVdfCV3mUjZ/WMTijYj2ctU8bpKfjAAJj9nVeY+PxCmmSYWG+kE9lhvv
 o0RP3C3iPUQMrN5H1bQUgB0hU17uZrzvTDkDF8SBt3j5VG4vSiCWg9Ar2VKYjqMynIIkmpQONWb
 OIncipZh0N2SY0t1NfLJjgxcKUGTtDoRjcntnfTX+UwwsoTjXAGDDuPJ1kOPSO5IPMoHtN8z2LY
 sE+6emZIvJdGeIfl55Qz8Df1uewukbP3sAO6uUAvnwjcAxIHLVxGkAhDxeW56Egf0wbh0RhocM2
 v/E8kc44PoCg3yeVnQw==
X-Proofpoint-ORIG-GUID: 7e_Kl0is8qVgjggCXh4Fcaw6oUqCmmlS
X-Authority-Analysis: v=2.4 cv=eOYjSnp1 c=1 sm=1 tr=0 ts=69e77326 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YCWiAI6G9GZrcvXlVdoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7e_Kl0is8qVgjggCXh4Fcaw6oUqCmmlS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210128
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103943-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_SPAMHAUS_PBL(0.00)[78.88.45.245:received];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09B6D43AE06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 11:45 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> The APQ8064 HS USB controller nodes describe the transceiver clock as
> "core", but the ChipIdea MSM glue expects "core" to be the controller
> fabric clock and "fs" to be the transceiver clock.
> 
> This mismatch can leave the fabric clock disabled while the controller is
> accessed. Some boards may tolerate that if the clock is already enabled
> elsewhere, but it is not a correct description of the hardware.
> 
> Describe the RPM Daytona fabric clock as "core", the AHB clock as
> "iface", and the transceiver clock as "fs" for all APQ8064 HS USB
> controllers. Without this, USB does not probe reliably on Samsung Galaxy
> S4 because the fabric clock remains disabled.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

