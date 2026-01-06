Return-Path: <linux-arm-msm+bounces-87577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A15CF6130
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 01:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66E063018F69
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 00:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A307081A;
	Tue,  6 Jan 2026 00:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvVajx7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNQ1yfRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1650A33987
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 00:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767658937; cv=none; b=DDK0q4PSGQ3215xTjTLxST1Gi5pt5EmgRKCIwjdDOhx84S2zxU+PP7xMEVX0ozJ8BAuTMu3jyOBdniFR+qzEdvUQjrJZnUFFrE7467EqFlv+VVeEV8eSCHuzOGrJIQvazIirIfg4O+Wxjfzp75JDp3eh8U1IbsQL4MatBdf6Y4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767658937; c=relaxed/simple;
	bh=psGaNMYCcA3vTNboHCsJCf0mbGjKts7x2MCloWKs00Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8ErOA8/ZSj92m23Xe64FwQVWLrMrV4vUoRNpcDJOuevcM2Y0vZQfjrbZlycof8mdaDwCZ54rU0iFBBtf2jVFb1jbwh9ghDP3mHn7ti4waV7DqZzcbxgQCrB3gpjUAkGdbj1uArKG7a/qJi8e5OL8fUuYz7ch7viymaDMax2XPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvVajx7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNQ1yfRv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605MV6iu4032721
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 00:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xybdF3OLB2P8zb7gKJjMg29j
	Qi8VyXoqHV6TjiefLPg=; b=UvVajx7a6P2iguxLmIsaWGb9IWTcZmy71o5u509u
	y/TMIBu4ErdCCV3jX71qVwz3wHUQBBzUXu080aVTDESHAGCiwA+6bQ2mtyVp2oOg
	qN9DVCX1J39X5o1euaoEAvDfsUNb5cU0H3SlWpQOSNT/ZKCY5QfPR4FUOw4Uudya
	1H+rbyriqojW6aslVweyNKgSxBgYA4oB4Omqt1VlcwqwFt8GacWa/pDfPPDb1Vs8
	V52HzTyPnHALMMbS2nMftz1HHq8rFt8criyuhU3nN5NEVVHK669MaxgdtmWdihrE
	udY/GAIddcgSbT3nSm9feY1lLtFZRb2uifErrwXrMT/KLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79njy9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 00:22:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee1b7293e7so15832391cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 16:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767658934; x=1768263734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xybdF3OLB2P8zb7gKJjMg29jQi8VyXoqHV6TjiefLPg=;
        b=eNQ1yfRvIv6Mfq1KJER6fFtw3zxJxIp90HVJe3fru14cP1vJlQAaFQk6Qqeu3d1qb0
         0iDGXr8VhDh88mebX6QBoVoitdBZAn6EuaMF5iMMAldGsKoIgMEqpBe5DJRB1kcCJXOa
         TlxFhpbiRr3EeNyaYtzTRTVR+/6cZioJ8UK/KoTr1HoRe1R3bjUaC4tBd/sYXMwrJLYn
         b2AOg3T8hdMMdHt9U36tUU2WHDA7sdGzMcAwIcQLCytaZN8TQGeHbnL2pnZL6FucI4b1
         eOqj0RpQmKzMVML9RPjDiM6OvKMA6Mx3po7x9i+5iefyOz6oP6zsdZxIz/T5gzcqTsDU
         PNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767658934; x=1768263734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xybdF3OLB2P8zb7gKJjMg29jQi8VyXoqHV6TjiefLPg=;
        b=o94K9tzeD822zsBU0ez+VP5hc+ryfKR1YrRANOJ5kFNW/PzQv3UCOQi+jglaOD5r4A
         YUj8vYnsJJsbb+RVj+9olBWtJtXsvMLzz6SG0s0BlzPfyApPxG0csF7f85V8D4+YyJ9M
         3mS5gdVbZkEEFRcHQA9ifMcaCCv9WDEkSfv04yby0b+7l2FnPgXK4UIHv3m4CdDbjn0t
         qvPbboU49oj5NeycMLR4iSY3sCP6nJWVcp/lsfu0nfVBDLC7U08lXRZAF1EBk3NqdbWc
         Mobfojc2YdmPjKhewSRH+B6vjlVnK2KKxIJ7oizLqHlKj/jWACjzeDyhJs+6TCF/3aIj
         XdGg==
X-Forwarded-Encrypted: i=1; AJvYcCUPJWynORhKB9D/CVNWb0kxKkBZpcxcAo2UuGkY8ihTIgPAwlQZ4TI6+k+OLejculQlU18ttFP7ELH0sV68@vger.kernel.org
X-Gm-Message-State: AOJu0YwvNXY6HlyRF82Xf+TzoKkf2r4NzEISGyN1+tfE7NacWj0cyR/k
	fBP7wtA2NCuVqX3WncnJ8JN9X+Ge7rjrcZWlhyIeLf3cIeBnDdKX0ILp4ZfupMRlM+hPSwaxKOq
	gnn7NXRm8n36n2i7i6J6HC2ncg6/arplVeU3oIZWGoI1+SRyWL/wDdz9LIKKVcLZdU66q
X-Gm-Gg: AY/fxX7JxNG6LqUC6EJG4ypvIfw+SECyoc3SbCoaR0fzt4vho7PospCAUvf9lZXs8+o
	WcLzH434hWKvYqyFsSv1rdgumxxEUbTEoZS8dKOSGUvhJiTb/UPTAOdCCm4bq/ILFYl9Z7DiA11
	6l8zOGt5UFRxI8AouA7OoXqYkOIfoYG5o8jIZxw9lvNn07So0dT0UjGGy6qn5qqFAfJd8TPCMUI
	QoQ97AhIGcCxEeowKwXaoMPpmjhcCcVNlYXQq/9Im3t70V77vXoUqFEzbWgOlcwiOWDplktx9nB
	N/eR/+H9YIOMxXu0YLlvAkLh7o0UzNy195q7L004gJSWwohg+nx/4v4BP5xNAAwJpVXuCl2TokA
	8ry1NB3zR6l8B6KOrgRpGA7n97gSDC6tYRKeUMCgeNBVKTgfIZV/m2dw7KEOZ7UTtLZ1YirN/dX
	nbZzrYSjY4E5j8x+gy72Bqf4M=
X-Received: by 2002:a05:622a:8c5:b0:4ee:296c:c7cf with SMTP id d75a77b69052e-4ffa781ff88mr18987071cf.71.1767658934188;
        Mon, 05 Jan 2026 16:22:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoXYD14IHksD1lnlNPMEXn3NfkOeFfiW71G0cqJJxj/ih1y5qOGzlZ11rH5lAKk4LFtCoKHg==
X-Received: by 2002:a05:622a:8c5:b0:4ee:296c:c7cf with SMTP id d75a77b69052e-4ffa781ff88mr18986851cf.71.1767658933816;
        Mon, 05 Jan 2026 16:22:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb39fc3esm1539781fa.9.2026.01.05.16.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 16:22:13 -0800 (PST)
Date: Tue, 6 Jan 2026 02:22:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v6 2/2] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
Message-ID: <zen64arf23paingmokzix55xa5p5loi7e2qrf7bvajkiodekmj@nsqa533afk6c>
References: <20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com>
 <20260105055646.3816296-3-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105055646.3816296-3-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-GUID: doz_fa7XMo8VkYONtLRoXT3zc6AQKlVK
X-Proofpoint-ORIG-GUID: doz_fa7XMo8VkYONtLRoXT3zc6AQKlVK
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695c55b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nHHXIsCO6AQyv1VF1mQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwMSBTYWx0ZWRfXws9w8j7j9vf4
 GsLKLu2UsIl6nzv7uWiflcsLurzK3QlspXD0xTAqE42smePn4I4ORksp5z2sC9bez2e1D88HZLR
 Ds0XPBdjVySZdDAOoqW5BmqzLpkFHtBVm9B9vJO7UsnI9tJpELP2OIQCrdxjziDzH8ysrNRwPmw
 Mp1vCYzbC58IdmzIu3/kVhznFDdDsE8EkzzXigeA+GXsFh3MzdZK2OfUp3rvfCBgR+hy2QDBLO7
 HuURu5KLJp64Lae0VpEzfkK3NKSz9P0GbsrOe14sOFQTZnasr6tQc942pxzqLQjuoHqP4ojqLkQ
 uFhlswPkDfcC18bZHgExd6yQ+chz30RsjfSJCnpliXBziKWnq3/ED4+qIED6fZE8BBg9Q5fKl8X
 iQhHYpWAhSQctlxQugxpuKYEtMT4g7wDiVCwpAHvaHfNFAOSUvYuNrllTIflqpU5JXr/hu7j7L5
 xYvp/MqaPhYrQyqygmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060001

On Mon, Jan 05, 2026 at 01:56:46PM +0800, Shuai Zhang wrote:
> Historically, WCN685x and QCA2066 shared the same firmware files.
> Now, changes are planned for the firmware that will make it incompatible
> with QCA2066, so a new firmware name is required for WCN685x.
> 
> Test Steps:
>  - Boot device
>  - Check the BTFW loading status via dmesg
> 
> Sanity pass and Test Log:
> QCA Downloading qca/wcnhpbftfw21.tlv
> Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
> QCA Downloading qca/hpbftfw21.tlv
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

