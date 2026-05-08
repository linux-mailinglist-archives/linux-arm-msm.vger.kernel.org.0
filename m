Return-Path: <linux-arm-msm+bounces-106625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ/ECge0/WkXhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:59:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D717D4F4A26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFF72301F34A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5653C345A;
	Fri,  8 May 2026 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWL3Eum8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jatDvqI+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0FB3C3C06
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234362; cv=none; b=PXM68JagX5K4Y4u8fqqLs7tRph0HlOs+wwj3ESS2EDEsW4d1mN+xHIDmhN7yKAQPNZSRAhCh164IO/gJ69nGBJyOdkp1iZFvQeHOGHlJurkmlV4JA8n6/AN0LlgnCOX4/ddKtE3dG3aPtrGr0YcagAUYHdsWurwVOkKagQFXatY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234362; c=relaxed/simple;
	bh=WVtSLzjTVTbmEgTbjT5Fivh24TBFtje+HenDoVyan54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VeG8zacxqY4k7rSx4CAVYvVby9/efvgNw99K7U+Lu5y3LWapmn1jGFezt9qCXbC9eOhtNI1nC+I4J5NqIumDLwl8yqA7dJ9UVN1x8+y576MJPVKf1KGS85y3G+ze/NWb3iqjHwer3kz6gZmVDkBkJdP1KqAGN5dFacMBaCtATWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWL3Eum8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jatDvqI+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487KaDc317564
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qn0u2rVFSmOsPw9dKW2MjjRKtDspoihKo23AtaIa+f8=; b=mWL3Eum8QSKgmA0e
	M147kIoPilIPbnVJNQlUEC4gIRzkgPbuU0u3fckW5lsWkJ8Spz/FeQNmOeFJCgUh
	O4GQuO5Jd1DvybTdiUtsQ4Tf16rMifr5DX14yVjkH3CRM4v3bQm2SsEwOukVAbw6
	lz+IUUurCJUaL67TjQaeD+kc2L9jMArNTJefNT+VvISKw30mzwGqCZnhuoUI9KTk
	xZIKg76qQsaMpEb6PugiixNsFwcMjfuKhgYfiZFQhCxO5zN18rCGagZXWb1zhcQg
	e2Xpx644gilT7k1QLpY5psHyNWTUOx6HLypVQmJ0Cb31hbpJKj7lX9HNpmy6irF+
	/BqtWg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc00mqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:59:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575296be5b1so232556e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234359; x=1778839159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qn0u2rVFSmOsPw9dKW2MjjRKtDspoihKo23AtaIa+f8=;
        b=jatDvqI+taCpmKmvHxffdLXXEsAH6e3mBkJhWwqv/6c4Mh2qFooClfTVxVmIuCm1ov
         CWl4pP+U2kMigKWKvCO/fMkdf3pF+xzcIfoMH+xIx3ZoBXdN8jl3ZKZJoKLNevUfVcoM
         LtuywBxxKmO/tpvyu1Y5bnE8ITLxKGDmUvXY1YOzsaPvE9m1mA8A9DohvS+lrH+vUmPo
         QfVQ8ftkKgxm2H1hhh9RyyGJcSEh67t6y47VVYK9+D4X5N4rVVFAwzi9vGD1eFzlE7B0
         M4Yip2XkfYQTBvwUMtEtQpFcAAf00D5QbDSK7Z6fkJqLlrGdDZDxKguEdrBiMyab36aJ
         5/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234359; x=1778839159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qn0u2rVFSmOsPw9dKW2MjjRKtDspoihKo23AtaIa+f8=;
        b=WZHmunf8/zqRULA8qEPldajfKQzPaZhdDFHanQkmArzQbjztD1l3lNhX0kZnm5WVT/
         HIeG0VMXfnhxd9LxJleYKJfXLlt7CVtX16clyoT3Zxg2jD3QSDU5lYA2lnPC1v0Ciiv7
         GMIKqvvIU+HbltkLzWIjY9K1mVMY0RAVPxejqZn/02LAeOOD1drVbtNBo1j10c/npROP
         Oxet7hhhp8WSxSyQxiKe9ZfU4TIVqD1djCe3HTno3p6BeeEWavTHQFQK3kRTW3LaK3uH
         Pasc0BGkw+tjFFLSkbJFsnMJjp7GczZDGtcn6JWJAXDih7GDgS7IXbnUcCYqajkdUD6F
         7wSg==
X-Gm-Message-State: AOJu0Yzi3FIseN7TZmKeBZ3WwhXuLGr5N5g8GijC/W7gJLmdyzU5jdCj
	7jVgyFDsWvhldU1T7lYwwaPMj32pPvHfSicC6K+ZJWMw9fBDA+GqTqz58RTsLQ9paOxHGUrSRu5
	heyEhAbVqD15XztptrtbYAERsQatLvWzf3YV1rKoPGD0XZ08tuIDJcICXTkC4KQVZEFS9
X-Gm-Gg: Acq92OEvScKc6Fe52E2Cocf0udMpqKNuKCfXxV8fWnTOEWmVLlADnWXNUxWBmqiaXpF
	EFSY0sGS+iaqGf6jRzKRTKgqaHso056Es/yDt9Pm6G+PE/coTIwtwVXhL27cBr8QPOiRawa3RSx
	iVCplcjv/Uv9SyAsOyJAFs/xqWlSqUL1HDq8xHttR09xnvqJhYotbfkaHzNKybu9/+4z41Ykz8O
	58r2CCGdUjRUOfKokygQE1SjUTeSNJXc/q9Bl2gPg5C18d0JdClzzydHZwREaE2C13Gt2haQFMe
	lnZC7tdbMN8z/cz9BsNxI4BKAEaiI6hGr7fZpg12sBMp4nZAYYwZ02iZmGMSDkgGRr+dxK/R75m
	iT3m+RB/vy1ETJFeVxce7zJyzfWR4uJ3A7DsD2yYkVNeclNtLE5a9qLQRCjOStq+2/xk1ncpiE7
	GlW3yj3HOUxoSswQ==
X-Received: by 2002:a05:6122:32c8:b0:575:1954:4396 with SMTP id 71dfb90a1353d-5755cdfee8amr2625419e0c.2.1778234359571;
        Fri, 08 May 2026 02:59:19 -0700 (PDT)
X-Received: by 2002:a05:6122:32c8:b0:575:1954:4396 with SMTP id 71dfb90a1353d-5755cdfee8amr2625412e0c.2.1778234359209;
        Fri, 08 May 2026 02:59:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac398b017sm58092266b.38.2026.05.08.02.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:59:18 -0700 (PDT)
Message-ID: <9e1f0853-21ff-4d81-a653-f3cabf254190@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:59:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/29] drm/msm/mdss: use new helper to set amsbc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-20-c19593d20c1d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-20-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMiBTYWx0ZWRfX8nWL7I/V6EXD
 AcI9r+FbRJPy9RBgo+wkPgh7SR93E3U0eG99du/iyaO77Ys86r/ePdrtB5pdTSsBP42HPg7NBPq
 2bHp9ImL/6CiyvLNq8PalrV6ZNrv9OZ27hc8M8Ig3HtD/btnp9Wa1obwklaA3AVjYsDkFG7hv9F
 6WPFXj3rSNQ0UEWJU6UNvprmePqR27p5MffNI22XkX3ZPU6pg7JuME3tqQ9tQHF1MQBIhOajlb5
 m615J4WWq6xFRKSQFPotY27SYMqfK2hT1A7AwSrc83SrLq+AjiKgYfkaLk1bOLTXi0czWSGuoct
 0lcV3MXidbiGXTDYHy3frbjEDbhcT2b9ADVX2ZCMBRX/SN9GRmzC9CFLUMOFiHZZWkgiZUaHfLu
 X45R6A36AwoDaorARkRXmm/hkNjFsWv8yfICVZmgNfjIGjwXVsRIVbAkV7DSMwC1orenFsNj+uu
 up3mzFsVa7IIn0nEmCg==
X-Proofpoint-GUID: cO_5V0Z0TeAKLV9arQRarFLVo8edQXfi
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fdb3f8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vz_rfR1X6w8aG-yi8FgA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: cO_5V0Z0TeAKLV9arQRarFLVo8edQXfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080102
X-Rspamd-Queue-Id: D717D4F4A26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106625-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 3:03 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of checking the UBWC version
> directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

