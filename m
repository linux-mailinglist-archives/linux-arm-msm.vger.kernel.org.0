Return-Path: <linux-arm-msm+bounces-86293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ACCCD861C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 08:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30A913001BDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 07:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA5B2C08C4;
	Tue, 23 Dec 2025 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Es+lQjtq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQqxhECb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E7D1C84B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766474722; cv=none; b=QHompl/zA/7AhnmZmBAIo/ETYQAkXAmtydqh/5pqjWgDrW/9Cw7t55TRe0//7OjN2hHrDE2GyCx7cp307R6STl8eUH9IFk0nKHpRYtMBGjkX6i9jXFD+brRrw9kiSCC91X3yL8PpdGXdXpuR8IpcYXLCEo/cSsv3cnn22WqXOOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766474722; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=L0tdmWhTpnLq7txdnXiw3MesEDMFhsD/XAg/Pon2XcPurDTLuA3NSmUfszAFi7j+26IHc9yWCkCYGfBhIkLJ3RshG/PU5rmx6RV8udcXKm1p0EfGzOjDtcTONCsXNeXI4c4EKNMGW/rC4V9r5R3zfkPIeT5ccU4KCzXI/RmmL4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Es+lQjtq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQqxhECb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5imV01902183
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 07:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=47DEQpj8HBSa+/TImW+5JC
	euQeRkm5NMpJWZG3hSuFU=; b=Es+lQjtq466i02+72sOW5nFx7Ur2/kuZyiDlEm
	pw/Rnq+R3A/NUsjdFqTAUUHtcr4VismJpQLjmZ5a2kh9xcBKHMTkbXmi/M//cgJ/
	WGWoTEGIvffqXb5HUetrruEoGO/Ns/tDGyoSmJKr10m7oebRatUn0TDDup6ks8vk
	9lGtC5DXiQfeIormvue2XyjY8ZiDwaj/WOqCeIZbeh5/ki4OzBetJz6GNYjPStuW
	jkS3NosCVjyz74FJV2tgC1JOhrQTjlZTPQ8Tw6U7K9BRJF5YNIX0ybFj9k4JnnYV
	vJyQTYhoo8dUUgVyemporZjBrow2sack814T6tU/X7TfuLdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8j26g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 07:25:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so9376684a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 23:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766474718; x=1767079518; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=MQqxhECb6iPAHbkY5t/5WHIi3IbaJqC0MbO77CzCLeUglkVuD9yb+cUYGUXKIvNY7I
         nV/Kz9oF26lncsuOzJcbfYPv4u77UTt+DkFyttBBWAPaMD/iR2NKN1/OwDFuEsIeUbmh
         7hUc+kapZLazCaEFswT7lnTQOUOwz5U6jbeYkKKSNzliGEhHcCIHnekE9/03hQ/Jfw95
         ZirwRYVfnqMEPKntrnBg4rxs7Qe8W1ZFZSFV7XTV8vCqq2qk8Fch8HcD4mYeoMe7QkAd
         fvqKus+NbbYcrDli4BOZrTBKGJiOq0QkTxzWREx1QVPIXA+lzRm+iJQe+AY9oN9pWn60
         A92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766474718; x=1767079518;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=rn3TA0J4wvS5ai3tD98/Ozv36liU3K/sIk186UMjdlZ5/PeqR4CoCGGCjd47oVpJrc
         wtDfV8S04xMLiGA2I8bK6/pvwT+u8vH7fBYFoxwotZQ2kNONWrYNb8hQ3U3SmYHEI4MP
         +AVEQLf8uBIGzp7OXSVLCJFD8evjJlxjHHBv7PVp8mfutRnjGtBZBe+FV1F5h2rxXtww
         7htTEuCsFOQZArXqVtYH8KLvhXYnCEXQ178s8AzYs6Di6HeDgias+DA2Wn31UOkkwoYz
         0QOyiMs88/W2Q8nUV6AieZCSJJFcP2l61YUSSkTkLn2a9D6rR9eHm6DxRVoKUJF/uzE5
         F4sw==
X-Gm-Message-State: AOJu0YwVSDPj7adpY7M42NrbTvpyvWKQyI/0tc/Oain40v0UqT0dQmY6
	6ukybYSyruuMBs8PSGaF+aP8vvcddm0aPC26uN9uXtyid3v961LxoLILLb6O+WmpxrOgVk49ldH
	L9Mzbu8haYwPlbwvJg4uPMpu1NP1CNU9BRUDotywNjEd1EYJMSRs5Du2Aa29BEeme+evR9vLpeM
	hy
X-Gm-Gg: AY/fxX4Fb7n2iMRhgEf7dYZWYCOk/BBt1F23Mxj/ob6AOagxB3crmtV3v2qN/kFK34k
	HziedNqcvQiSyGSHys3WB19llQ+3TpPv3LNH5qwZ4mwqqIPuIfBkI45PBM8eOkqSo7cBFnFy5sx
	P/YlujI1s9gPKXuh4vgB/EDco+lIYLWsP5fhHz4l8sx9hTk+rgIp61KD0MGOxIY9ad9U18vkWZ4
	JnBBZOGC0kRT1mlN/Kx2pPRagfG6APB2/sS0o/Y0wVEtjfk0YndR5eY2E8W5FEyBQwiXc4qe0zZ
	h/EJbUqqHxn0ZI0h265ayK6c0SFAGxuztKgQ2oVvKavdqv1meYXjXB34N3BPtdkGmjJnDhP5gCg
	N8S4BNMw4gpLXcj+xkuLme/3vTmJdU4m2ecMMZeLF
X-Received: by 2002:a17:90b:5703:b0:329:ca48:7090 with SMTP id 98e67ed59e1d1-34e921f8ad9mr11757718a91.37.1766474718255;
        Mon, 22 Dec 2025 23:25:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYGePSB9i3d3xin9xlYe9X2Qfym9HRosKsFmdNiyHMYhTI9u5zdE5qawYU1Xv4AmwbkKiEQg==
X-Received: by 2002:a17:90b:5703:b0:329:ca48:7090 with SMTP id 98e67ed59e1d1-34e921f8ad9mr11757711a91.37.1766474717811;
        Mon, 22 Dec 2025 23:25:17 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34ebeac8623sm3330116a91.1.2025.12.22.23.25.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 23:25:17 -0800 (PST)
Message-ID: <7ab1f905-69e9-d693-7775-32119e66e2bf@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 12:55:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "linux-arm-msm+subscribe@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Subscribing to linux-arm-msm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA2MCBTYWx0ZWRfX0aiQCfjP9qq4
 /crs790sqGvEG9Nm+pF5W1Z23YOizjU8/un662WUEKyl3qb5HG7PjPpZmREYAani3m65Sqw3TwN
 L7qGUl+odbeiv9OgWyepf3Q1YoKpPbyWX2RqtEw6oLhdpwggozqt7rgX7MFgV0MowAWwxcKjnCR
 HlYmLAI8TrafkBbABmVJAIk3laHUvRcZbacK1zqWpreZjLfHMi7LKfsFbGpJOhyRl+zQs3tgysY
 ISzpbbECYUUr8DubGkgTkrRJ3uA4ImDKirADJrMhazNAdVz7UbdwkglVBSbdkBmqkaTbjmBYexl
 7WYO5xqJ344HTnLUIRAL5XrVfrV5dFHijlZX5uU0huBqzwmP1KqocrP1BcAqvH0X/eVi3zAWc6F
 xFtw9+PcysfdTdBRa/V9hgfQGZO6RF1ojMJ8XK/XIz2DvrEmKGhkxo63ab5/kaPJyNXVNBs1hNT
 MKQPUfTdcLLTXYSC3Yg==
X-Proofpoint-GUID: t5TjugX5ecEd5KecWMIb4mmR9EqAXKl0
X-Proofpoint-ORIG-GUID: t5TjugX5ecEd5KecWMIb4mmR9EqAXKl0
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a43df cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=oASd5UHybYt+Hs44tZ/i0A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tclcd6dtLQvEqt9_mmAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: 
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230060


