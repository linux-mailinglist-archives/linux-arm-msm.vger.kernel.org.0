Return-Path: <linux-arm-msm+bounces-87095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DF2CEBD4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCE8A3007D86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 10:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA2D277C96;
	Wed, 31 Dec 2025 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekCsAV2O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U1c5luHM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0139D313E02
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178690; cv=none; b=WnDKDfdrwH+GHXcqQHD5i4DxD2Faj03ThrmzBjU/ZmhF9HTF5tpU9teQ+QXb8QHqKlIHjEnrc+iMeIO6YlPj9TOZRwtO+Eiwnh1XjUB32j3PNlUpwCvg6x3vKYAjK0Hf/1vmKwPfMWA3fR9aAEUilm1u2vP2UBH1yFuX9JMAIs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178690; c=relaxed/simple;
	bh=B+7AWu+tS9G8ZNuAETesmZnIgnJ5Xd8o9lFd8WLIhdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TzUM/SfuNpmThHobtn9FKHTg0lClovdlWOjro7H+4ptGIxOtfVttMRi9BQ1WLkTn/nyGKkvH9xtqY6Pl20zKxBJjpLyqgZOxphzQcKOUdpKiO195HW9L8pQLIS5S0tAHu0TwKZrmABQ/NQJGQxKxAWNib5qAaITPrrlQBNADE0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekCsAV2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U1c5luHM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUKo2ht1152216
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7cEHZ+eRInETbu5GOl5SXv/YjMS9QIHUHvjMzHMuIBg=; b=ekCsAV2Oz7+qfTvY
	Jfdo1h3zKwZ66bobiRxy9g0IQ/45iVNEdTX+8JZ1z4j9Kb/xHdLxsLHaZ6ux7H0y
	49m5i8vC5GqT18jsoAa/Qk+4FQ1s30VUfCNAHLmbXBjZrSFCfWYPASeZxif7nofH
	B01wzNVN3iYe0pgsyvLdkiWyEUr5Y062POPB6vUG4mnvLDvmmw+oC0vYePtCxmfA
	4hC4/KAmaDmBLwjqKAZtWQC0Wkx7fm8Qr4T3Thz88qKlNaXJUOnkvdw2da7NNhpW
	5EGjGP0f4icjlYk6+a2/FgK0WcbaMurhkifdzshR6iATOcENl5Qk5tKr5TYNlnLX
	vXkK9Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gv9ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:58:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ab459c051so26349515a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 02:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767178686; x=1767783486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cEHZ+eRInETbu5GOl5SXv/YjMS9QIHUHvjMzHMuIBg=;
        b=U1c5luHM2jY0n6gXT4tEQFTjDpwCI6FcV+StCz1YvGANAOegJkVadmFk0ptO9C4L83
         hiNkJHl9gYUbZ7/CkSj5qhnXLDdj2p+gRbv3E8mVDkFa8lK1PEwKxJ56zNyzpDGxS6uP
         Tpkpcrzabwi+S/8S+nq4JLBgxbui5GWA0iJBg43jrs6tK7xJIwtVc8dhQ2HK7/ZGhDRH
         etNyk1YAJnz3TWkkBkclnfMm+l9+egunMLJLNdPCrXoDJRSk0SaB8FEJfx8L1G+SAMrs
         vuvzT4X9kepeWdx1zcNaY2c/deTcpHgAb4XAZlW4mVaa8VUaKGepBI64s0ORKlgAIqFP
         POdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178686; x=1767783486;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7cEHZ+eRInETbu5GOl5SXv/YjMS9QIHUHvjMzHMuIBg=;
        b=ZchB8sHez7q0b8VSP12EvLIXLiBeVBI8jtK3yQfq3CYyx6+/7QcpAW04E0BCoe8SgP
         97E34Ml1ZgpGn74BvjgoEFMJMjz+dU4PQILltuUZSUgKvKoevu3Jh2jfvF22m11bppUY
         Ernu/e32RYIzViW5Kdsr88LFHqoPFPlG3ga/lB4vQY2dyUkdmC6N+oXvZ88E46Ginjqw
         MHdCYNejqDKTJqIegWEUbnueaU5xcj4A4ukACozPs9+G52q9UTXxq8TAdzZccRERZimS
         Y0Dzvjni3n6xhAxnF16bh2svyWQRQdzIUp5QhU+IWpVNRZNgYc55Dylt/Zbm1UyH7Qby
         SNmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1+6fGozYI+B8+XwV/pWN+GjQEFN1oHWI4VEfQplHjyYrbn6DMaeaaD6HBH+qUXdWPfTY7UU6RiRtfL5j7@vger.kernel.org
X-Gm-Message-State: AOJu0YwdSHy+09i2lpPeFjXwzQfMETxFVXUvoohWoh15vDyVjsjosF/j
	Tc8AIAqR8GeCCMFAO9zBiNBov0XxhnOaL7JeF53v2qgPwtxGoVEOIfinz7+2ZLF58SeErPR5GD5
	r0vVcwsOtUXEYHDfPvfGu7DHsuYOKWkXBqgRFDk+iUwJL2m1hUwzZEDMZE3gj/+zRGeScdkSVaQ
	aX
X-Gm-Gg: AY/fxX4Fb0CL34cAxKrThJYwoEJ5HnIYH0vK9d9kCAXUxxnrYBGGert3ITNRyuhedU5
	ECF08mUz5Ylc1izmcActn0vmgXL8bRVW0iKCnbsJrpX4tt5stvrgGUmLtBZI+Rk8vsKKsMgLz3r
	rzJ2qFWeLyndaXozqlDZynZN2X5oNnGpAZhEg1aeLQk4KQUCVQJldfdI9kzJ/gl+rbHL+e6xzy1
	Gcxi+KIVs/ql1BbYRPdTQsVpxJxLXPLT+CUPqpSfnwbw+o1Vd603wY8Ki5idm0EPLq9lv35fc+6
	54g3KBZXv9Z85FA8S1FyPP0aDHLzMly/I7qozQljduDZi3niJC8gwwVAaoUPEK+SKC2VTHThGzw
	M6As0TA9NzdfS73+SEPYTPHDwoQbVP+Cwkkr5jw==
X-Received: by 2002:a17:90b:528c:b0:349:7fc6:18 with SMTP id 98e67ed59e1d1-34e921448bdmr31719496a91.13.1767178685982;
        Wed, 31 Dec 2025 02:58:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvu2r4LIN4SA9OiECV0LpeXSeLXxmuBafFiB4kvk/4/LJ6sFGVHknaDsQlVdJNTAsvjEXHww==
X-Received: by 2002:a17:90b:528c:b0:349:7fc6:18 with SMTP id 98e67ed59e1d1-34e921448bdmr31719479a91.13.1767178685412;
        Wed, 31 Dec 2025 02:58:05 -0800 (PST)
Received: from [192.168.1.102] ([120.60.65.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e773026c4sm14539203a91.14.2025.12.31.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:58:05 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
In-Reply-To: <cover.1766090211.git.ukleinek@kernel.org>
References: <cover.1766090211.git.ukleinek@kernel.org>
Subject: Re: [PATCH v1 0/2] bus: mhi: Use bus callbacks for .probe() and
 .remove()
Message-Id: <176717868367.10577.5328540743065909423.b4-ty@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 16:28:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: vL05UmdEfy1FpcbuYjoTnFBlA8-sFQ9q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NiBTYWx0ZWRfXzYkxEL1c4dla
 Lb/ELpw8FSvn7KqCQ/K56Txv9QtfrtRyRhDM+8Ubfvu8hTviadkGu/upP/bXawmyLpuvEDQqvx6
 Z923pDh5D3U/zBlJhnLRLrldyELyxLkuMPSGsLtaWlV+wDimD5VZWZ8HyLMXwxw+HnMGiq+5JLR
 kchBfd8ZpfGTlZO1WmEFeWGticXwMbRmFioymBnBXU3avbjqWoWnog/2P+EgDBJQpli1bNdhTRm
 f2caJnxHi78bDMheSPgSxYQ+r+yrbLSYRV0P0e47arnt6Je648CdP4R5xZJZQnCxY90BpyKTKur
 VfRI73pDHYToJkChZxWD2L4ziAZ1E5H5JtJDgf1xeA1/InO91DK7oiOxAbdXHTk8Jh7azBXXnMs
 e/ncnh/Er1MTWCddNXuC2K4JfdGafbkXa7OxDv82gwxsvTAknKEfzJHNzWY6OWw48b4jZpgjYno
 IJm8IEICxWDQbWhOEzQ==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=695501be cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=+SK5D59PVgoENw9OlSzWFQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=y5gR4R5bsXQQqZBJ864A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vL05UmdEfy1FpcbuYjoTnFBlA8-sFQ9q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310096


On Thu, 18 Dec 2025 21:42:14 +0100, Uwe Kleine-König wrote:
> this series converts the two busses defined in drivers/bus/mhi to use
> bus methods for .probe() and .remove() instead of the respective
> callbacks of struct device_driver.
> 
> The eventual goal is that these callbacks are removed from struct
> device.
> 
> [...]

Applied, thanks!

[1/2] bus: mhi: host: Use bus callbacks for .probe() and .remove()
      commit: 8535df5dd64ec02d85e65dbcf79a59db9c16d921
[2/2] bus: mhi: ep: Use bus callbacks for .probe() and .remove()
      commit: 91a0b0dce350766675961892ba4431363c4e29f7

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


