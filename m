Return-Path: <linux-arm-msm+bounces-100798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KR5Lvt1ymmB9AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:09:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 411DF35BA64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD791304A538
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4EA3D349C;
	Mon, 30 Mar 2026 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3Cqh9+T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mnps25Cf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F5E3D34A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875906; cv=none; b=ks3br09QBsvRLcou0YydFv6+gD5pEkN2L33p10LIN09/Jptw0XNHxnfQt4xdRAt7joeRA+9BcGRctPJ4zbZcEDJyO2dbQiv3/4bOkGnVWbbBVtS4vBS0kcG/a8Hb9GgXZeyg7sO2uGpEAfkpzpsKt7WNSjqR7oJFfs8P59KxFTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875906; c=relaxed/simple;
	bh=VdhMMkeb0TEAaXsVeFSX8pNiZiJNeyT9wqWROTXJIwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqGVMbtbOsVh24r1HP/9Toi/XRjJ4xQ+ZLahj2iRtHd8zFeNiza+m3RzJ9ASdW19WGzyEJNUWypdkfEBXXOOeRNsAjC9dCfF8+rln861YgL4ub5keMG7okyb3XK5POqJLM/DGRx9zQd3dHCfwSTA1YXcOE4koAKoZvBWOQPLf1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3Cqh9+T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mnps25Cf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UBZiK04013755
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5F6OiFtnMdTgNDr3//AADnNY
	wPc7rvN5471UHjhkqdQ=; b=J3Cqh9+TdyFAp4SbyNvcYSdoW/mujim2V5h/0FzS
	IBTbhVKBILx/Qtk5Q3NCH0+giBjGZJIZ8GYOkt9habygnsyfHz9bJW+uXVzR/czA
	Z8Q63Pda7Mau9P0wcbkb2CQGjDVQVdyqcHtSRJsbv7oKfI9iHcY2qSKBTKj1usU2
	bm+mO+59JhrcJZu6nOEu9qSAVDxNfnSs3m1/3OvtBKVGXUfvK3Cyx/x0jvHK3p6y
	mfdmOFfwi9MyDn4bQxBtjo1jEFbjP5HsXyPSLxFNrYqnvR/4YDh7Gwx08ASc/lUD
	wu/wNkEI60cBvx0eDuzNSQngeK/FwVwBDniRWlQSPA9g/Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regrbe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:05:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-953a7e2c35fso363829241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774875904; x=1775480704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5F6OiFtnMdTgNDr3//AADnNYwPc7rvN5471UHjhkqdQ=;
        b=Mnps25Cf5e3CRsRvn1TW5IGPOb9cuOGm9yEPnLHrRhvDbhnzaiKrIQ71UzRDj6fQ4C
         6Wn+7ITx2M4iq8c0TJFYU8rAlmmyVTD/z70KepE2YoLOFPzgkvly1wZ8UAgTmFARwkJ8
         josfDHWvSlrH+1uIBkz+zP24Le1Arwjgpy+RerkCoTQs3F9DQHg6y9Tv4N9Yv7EFzx2T
         NHZnvbm5rjCqeOR00Juif95AABAZfdsHztz+aBdJ6MxE4LvDK5OxWv+VS5uYIgONfy8L
         6lLlJoqYCxKgQnO9giYnyCwhkM1bc3T/pP+ondOVCM3yUG7Bp6ckKQQHnyTFCo9FpN8n
         UfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875904; x=1775480704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F6OiFtnMdTgNDr3//AADnNYwPc7rvN5471UHjhkqdQ=;
        b=DyjuKX8GK7Mqe4JrTV+z+lWB2+N/yJJ5eVGutM87m/jq/acarAnjPh0GJrPZDVvWy3
         AalqVSfCdKTPNOJr1FV3Nw60YUE/Ow0BEUoqxEgG1ciwu8hRjUxYJwn7SbCOyt1jPdwH
         r76TeQE+zQrSxyWR2hNMPHzhhZ9Vf0HRkw+MBSC4NPnknw2f6fH3ucXkeA9dBc3tJBqu
         zygIsHLBRqg8sdJnMI2ZrleixCWge8iVbSt5HEYVCSOWwei92dx6S2EeXW3x5k32y5dr
         9c8e4Y+Q7Ldxhr4qdAz9pMWmLp0J/5JbtTJyAUSH+GDdYX2CR8Tv0X1NhyiWaa+XDaSU
         lX+g==
X-Gm-Message-State: AOJu0YxC6F5w1XhGbV/iopfScwuFwdLiI9i1Zl9nwg7juEhl6pyZUAgf
	hcM9FYn/nTYcR4ioyZpV1kJ8RAHInE+ZkANbaHaM9ylYHJ8FZIUGXJh3BLCIjMmZC0QOrnmBkuh
	Zfs0/IZWY4KFIJjQ/2egBN2JYf/xgEIAiqk3pDCsx6/HkTMtNcZ3LDmD6tNZIDWkrVuhf
X-Gm-Gg: ATEYQzw2LPKSW2UnE1mccxDu1glLIcJBTFdKis9/lmh/qHuIrwD5eHFEYvrpZ/3LNxV
	CUnj0j49Z3h92wA9FNNUd6Mhh91ZQnNzoIazrGAm1SlF4kZirVdqtVkU/VRLEtl/HZcXtVY2oCs
	5ZtosNqTXKHuV6IQDQ5q8HXICo7wAA58gNtSK/snbRqXVEvLMaB27OustA/9CMSNEuY4VD/Btcr
	2K9ap/7SWoaARM4BfnYKoRK5aJrpUYEkT64hVDNFBJdIenS8fH9fJHFMzSJnbxDo3kXHtFZujpt
	tSrYXlOYqO1bFlo5oHNJdvevtuLU47lYZ8Gis9pNRvOA8317Mc7D8y2ih0iIzR19EDu1LrTOXt6
	3n8eQmm0T/Y/qdnZZs37ilcUYhRQMDfjtEA/b
X-Received: by 2002:a05:6122:3c44:b0:56b:9784:8a2a with SMTP id 71dfb90a1353d-56d4a6061e5mr4559006e0c.10.1774875903530;
        Mon, 30 Mar 2026 06:05:03 -0700 (PDT)
X-Received: by 2002:a05:6122:3c44:b0:56b:9784:8a2a with SMTP id 71dfb90a1353d-56d4a6061e5mr4558945e0c.10.1774875902866;
        Mon, 30 Mar 2026 06:05:02 -0700 (PDT)
Received: from oss.qualcomm.com ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2a7asm20881322f8f.7.2026.03.30.06.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:05:01 -0700 (PDT)
Date: Mon, 30 Mar 2026 16:05:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Eliza QMP PHY
Message-ID: <2bfl4imfis2ts46fskz5ykoxyxcekz7ieesfqedwvy6tskownv@vuwj2mjswtaa>
References: <20260330-eliza-phy-usb-dp-combo-v1-1-2ec11e793a08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-eliza-phy-usb-dp-combo-v1-1-2ec11e793a08@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69ca7500 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K7JcDRgPh8oaRkcjYf4A:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMSBTYWx0ZWRfX7H7hvSF8ivdH
 dgeoxcHQ+uAKZ8EeoHzwaAJC/WqQUCcoD079gOnDeqaC8jEWGKYNh330jU8bbiI4v4gKcDgI6tS
 4NE291g7T/6UOwJjl4u3WXsJsyzxg995Blionmfef5zkLtiEH6+VfwS7z62FG2MGgw7daJM1J+z
 /lvVom2jJ5TX8horpNn5Nle73Oy5gqtlLVsJs9vfj+tJHDrFcUkEpYV3HjpyW3b+dJsUX9KD5FD
 wYWNWo/0o4JVXlnAyTx8V5vG3acqkkNCMfIi/rN4MzqbPoWSTrUZ2XnM8Ejmhu6Ao3xyLBDEZLo
 Khhwaw7i4vV/sycpw5nHNNYvp//rFmnWL/LpSzOZLcrI/hgSnMNQUalcKbX+0bompK5xD0tmyOS
 zhDs99AmA6ZSCZY/ar/D0mIwPttCrdXvBIHZpbjJZwbxpH2NKhaVRHDiRv3fSFDBGY0cmgkyYj5
 8xBWoXamcRXnERAkUpA==
X-Proofpoint-ORIG-GUID: DcJpcxB0nNWb4pXQDldn2DeZJqfe3qXM
X-Proofpoint-GUID: DcJpcxB0nNWb4pXQDldn2DeZJqfe3qXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300101
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100798-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 411DF35BA64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-30 15:19:12, Abel Vesa wrote:
> The QMP combo PHY found on Eliza SoC is fully compatible with the one
> found on SM8650.
> 
> So document its compatible string and use the SM8650 as fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Please ignore this one.

It has been sent already here:

https://lore.kernel.org/all/20260330-eliza-phy-usb-dp-combo-v1-1-2ec11e793a08@oss.qualcomm.com/

