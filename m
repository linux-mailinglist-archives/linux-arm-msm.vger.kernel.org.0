Return-Path: <linux-arm-msm+bounces-90503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM61OOo8d2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:07:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBCC866D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA0C430263CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692EF32E751;
	Mon, 26 Jan 2026 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LekYRQnR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="To+BtEII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDD332D7F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421843; cv=none; b=AlC6a6QtyINj/MA33+BNJ6DrW+PqyLta7YBWGOJUAsedkB6TkXHY0EyxVYgXRO0H6LWZau7zhjj2wP09oNsIkK9wluSg+oA4e9pbKFV1YHCKhsto5Dhk/2rrNpFBAklBbAVlRZEiq7jpEZJyX7fazdzmiFEZ6udbZAgVvaSIKco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421843; c=relaxed/simple;
	bh=meshrWDVJOZ3rlxp3ScwScn64Y5a1eFWTegEA09CG3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zht4TqQIxKe34kg1jRRqO7Ut7nPwTEjZjQ15DMHno/hI0roWxN9yl6OoZksarmz1PuGCCsJcv4qC3+McAP9/rIR0eVMH92j0jK/8h8i8aac1runWwfoGl7wJWcocGrgzW5Vb4QNe/0TlvkANLIp5oFSlsVFk6P7hdt6CowogW48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LekYRQnR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=To+BtEII; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8ctgS1016264
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOQIX69Ikp2epaqXjBwljfi+7a4aJtjJnPqY5XIPFuk=; b=LekYRQnRkuTZ8hrm
	ZVbPzeyjvfohDGEIZ9e/RY8ut3xzjtd+WcQaG1qNIcijmIBQ/szoH/WYcZ2BBAA1
	2twZgsi2hk5fSHC6d8JSkzUH4ijbL+S2Mrem1RKIeQRSoMH4kcqx0iPSCI4vQXFk
	gm+JWdEyHZUBH5o6v6aTEF5h9mZjcOCszWatyoY3KvxukTa7YZiF7jGM5CN63YhI
	EtE++ubJ/StDr9Ky87y4BDm+wMoQNtQ1bW4KohGrcz77GzhJ443JPAXCoq0pHsJb
	wueSveiCNa48B6HdS+4xLGVwqPZhAPMgUNl8tAjCYbypi3zM2K3M+zRVVjf3kX+9
	aio6IA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hc53m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:03:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52de12a65so87431685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769421839; x=1770026639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZOQIX69Ikp2epaqXjBwljfi+7a4aJtjJnPqY5XIPFuk=;
        b=To+BtEIIDTAGNgfgmeJCfSl9KTIqVd0Zg5X9bKCCVUzvsNV6U3qXuGvy2fSLd3yVHo
         IoUJra9gyJBLEbvrWeuS9WyMojAuRHvfbthVs01YosA6yXc8vC4tn9xXgKvNYYr3M9sH
         FiX7qEHQLyQe+SO85y/2dFAaP/d1ZCnlvQ54SmQG5vvo6W35fsiuvGhuB5TwJxrVz8Bd
         jLnhoGMnj7A1eSXuDV5JUVNF1gDw+koKqgAiVNww+Y0MgGimuJ4M9rkBFuBgTMJP5NqD
         jYnS5sx+5PcvK2APOsiULnma6X4zhpOAosHK9xBjW6pKRp9qFzE/XQgmplj51F3IW3Qr
         3WUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421839; x=1770026639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOQIX69Ikp2epaqXjBwljfi+7a4aJtjJnPqY5XIPFuk=;
        b=BwMB1wcuj0jmPzIiyk+/QJ/YtEACd72nQJqG+KU30pOGKPU7A4n6aiH17JSBvrpIWi
         nOIhoePqfV4MndkTc+7FxsHV1pfCva80z1QCxGqpx5q+8SILcJ/Kzu5LtY1K0WCVCBPu
         EfGXvhYde14MN8oM2C8oodE8yQmSoqD/SbSvub9dKR1cJXEF2r2AdLsx/cJF8hjKydW3
         DyXf6GEJ/yNR9Fc2NEu0Fa+2tLXyxyg909inuqfMMTlA2GYEDfRqjhr8m0dowkqtyur+
         URD9nNHYXgDcCJdRqIZeHbrUPgAHZteNWyIMIfZWDO4KEzwlxUvQqvK0PxS4XnDiG2ZQ
         e0ZA==
X-Gm-Message-State: AOJu0YyIQQt9rJB2DIXFc4votwpR/8sd5pCBLW6lVd5NS75wlzXpfUST
	6MvHHdGqih4RE1UMZa9Z0iPZmLz2suKHxGo0PysJLtU89uLGi9jsVyMqYKg4XKWDtli31mVkoS+
	ouOaxaPYLf4Gjb5n4j5aujt2Kka3ogBSbOx/jJ/YWoxCfhEori29cyHvsNSMVTsNJ0mWi
X-Gm-Gg: AZuq6aJ7GdVZrCzTFcqJ08q1xLEL3K4AmFMN9ss7fJljf6oC2APyEM0N4eSMCUmAUc/
	yxXEdSWP7F3z9PnaPJX5Fwz4xbnmvAjUPn7GeXzCJzyWZFDesW6f1NEM62nn3YzkCXyGUrCI3Jy
	uA2e0xNKURm8TMpEUUN23u5KnBtpND3LRKL7kZ/gXugygW6u2M/oWZPSWKqk4eCohKCLPDbMhTj
	LPpvUvio7eaVIjX/wBhgbKkWYl/PKS9XAaZhxV6NpHzHMSGOu8qc9O07KkTeMp/lmlvtvMF+OuY
	pJczcCyu232uqiIxLY7/i9qrdSdXc8CYAbyskEKPVcE6wckK4XCIZyg42Ug0fyJTrST/pIta4An
	/TI9d3jUdPltAgLXRp/BzmhObEg3XT+88KNIi+rABj/G8ZSY/hiTH/ys8g5bUDZUVvjs=
X-Received: by 2002:a05:620a:1a82:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6f957a483mr356874285a.1.1769421839130;
        Mon, 26 Jan 2026 02:03:59 -0800 (PST)
X-Received: by 2002:a05:620a:1a82:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6f957a483mr356872785a.1.1769421838796;
        Mon, 26 Jan 2026 02:03:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b886b596494sm549272366b.3.2026.01.26.02.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:03:58 -0800 (PST)
Message-ID: <4fab4309-1b06-4364-b0b6-7ab1d61c65ee@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:03:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-evk
To: Xin Liu <xin.liu@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
References: <20260125023521.3862114-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125023521.3862114-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NiBTYWx0ZWRfX9jXlXGd/MPCZ
 Howt4NFNi1PffVKU5/uw/6ZwYIVo0gZrsnpS+bOSUZx75C/oH5tPh2fdGbcVTsVsHAjAa/xem5J
 iP1jmq9gbpTqLKDn9DsiTGJbA50g4q7kk8q9mpwPCL3AWcO85QresXfYuHDofeV46QbroBnTPcf
 Wn1dOygmLnKn2/m6zmSvgM8F7zeKIjq5IpprHE4DnKDFYp6JfxSnp6BCyrIpFeIj8io8MuTaVPo
 JxXJXviG86vaXz1xxuIvDRgJ1wE9qDmuCcfvfSx+/BM37vBQ9FzRvzhcRZ1HaqzlV/vkPoNd3k7
 E/H/M5h9q3RutmUBZKSWgVDNc22W3xi5QvHp2l2dsuTILWHbR8IRkeKzMA+V5WLuP9M9dB6pg5T
 W/gXFQh+Lh9gQnAEXkVuscxse+Zy+CW97l9fzwHCH+qx6DonMh85O5xGBbqwOTgP9V6ixX1Jr0U
 vJL2DXiEZDH/3hSt6rA==
X-Proofpoint-ORIG-GUID: bBaiAw1Nc7AVc0tg2dJcE8thjweJuws1
X-Proofpoint-GUID: bBaiAw1Nc7AVc0tg2dJcE8thjweJuws1
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=69773c0f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tPD64odK4mGqIG_ypxYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90503-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5FBCC866D9
X-Rspamd-Action: no action

On 1/25/26 3:35 AM, Xin Liu wrote:
> Add support for building an EL2 combined DTB for the hamoa-evk
> in the Qualcomm DTS Makefile.
> 
> The new hamoa-iot-evk-el2.dtb is generated by combining the base
> hamoa-iot-evk.dtb with the x1-el2.dtbo overlay, enabling EL2-specific
> configurations required by the platform.
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


