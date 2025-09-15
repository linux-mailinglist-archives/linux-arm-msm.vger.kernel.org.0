Return-Path: <linux-arm-msm+bounces-73604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BB7B5811B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 17:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2B45164D73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60F01E8322;
	Mon, 15 Sep 2025 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xzjd8Ew7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E2515D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757950926; cv=none; b=UDtQOFz6ZkV0G4/iBzuN3u9FdxmUds3nusfP54HG60RnraGxMHoMi6JAKYV6kOhPMVvfIgAclS+NfuCo5jR6bkiuCxTIuUSsQQ7mFEXZn3eACtf8ySb0kSWzDDQgFaUw7fC9xAgoF8jxoFoC9RHIbO0onqd8av/tyhbGBveNb1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757950926; c=relaxed/simple;
	bh=1e4bIOCBVdl+jeIf4XWL1Y/bbYePYVs545U3st/e9EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBUo/ie1woc6SCjx/xmCRKPM50svHKgfKSvZHO0aCo++/vRvCIdOmTMUCGoiitSfnUL6NzYzpXJgX2fVfCSMgEK2cpxYg7DQeEAiVLMqibVzJ6y1kAv+F7cwHSgogkEDYmO7Att7HkIuB2tV0WJno4iS7tX4w/vJS7mZKt4cnUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xzjd8Ew7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9GHkn005136
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 15:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yld33n/hK15mRUGi2Q71KLZp
	QJLuSiRlG6PkHTx8TFc=; b=Xzjd8Ew7sSO3R2s3TIBuxL3z97OkcusbBPrfLpiM
	WqPEE8Ol2LKAG/pwy6OSr42q0diUHdrgfHeULnKp34/2sHksUUs320fSUDiJ79LE
	7NB14I4iMwtd4QMjGBFdNric8n+riFrmOP/aPuZjI8DltAQheoHdA8BK1fHkNmew
	Gl7m+0OQUu6oqfgX4+FXknYd0It+pUn2RQ8fRX3JhEPDrHllqSzwMADF+YypC6yB
	bZeUA6n+kK1V6zjVURbRX2IGSjI0qCpbxZTl97UaJzkrA3DanpVqHmRv8SH4b7Jb
	M3p/R3pLPU6dHGx6ciohHN45qHRekXi5eebKIipgLI0r6w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g12h7c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 15:42:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77618a8212cso2664005b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757950923; x=1758555723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yld33n/hK15mRUGi2Q71KLZpQJLuSiRlG6PkHTx8TFc=;
        b=RFivNosCya6wK7oEyx9+G2vlcXnmuC7e1gg4F8WZogO08XwZyp8rpicomnZmDmCLsg
         oQZ0EDs9hl9JMcUR/vVGeu1lfpmjcRDK/UtMTl6NE1kvIqQZQelAIe2IBk21QvHtaY0I
         ZPVCCo6s9Z+zvEzMQJIFNtdQudUQyvvTSyknRY91aGFpiGo44ejmpPzYIKWE24YxhJ7q
         zASdAf5lRidkNKXLcjJyE7lEsKscXe+CwxyY3QZAixPysJx5TTg5jYQy8bU3nntr42Hm
         MSTyQLW61lK4oV/1SMzmEYXwJvwdBN8lFXuhAXuRAKyIPeV1K9tXrWHxqPdKp/je/YBW
         eGsg==
X-Forwarded-Encrypted: i=1; AJvYcCUzUPHlPCQZ/qhZc0Ilt2JLSPOwMJf5u2/iI+vOKi4hqEoJEngraT4Mqdqm3vCXJFccykmrysG5d3EMzP/i@vger.kernel.org
X-Gm-Message-State: AOJu0YztUe52wUZU/fL4ippr0tqEHCNFjxOUjQF2VnTqABfaigPqIdR+
	CLBgOy2jeWMtjOA2jSNnLY79cgaQAagbblg5qODCZt2PznKoVVs6FJ6iItN9FzvYM5rg8zJ2XqR
	5Bpb3xCV4Wyufocg1UjoRgw6WAqPqLYygRuhWQENae18mfeFBA6vksln2eE/3xSKY4rld
X-Gm-Gg: ASbGnctjmYn8zu6kw/tokJzdNOJzjePYggRUW4nU3nt7r7tLgtXq37Sv/hDbgE1CfwQ
	iMs/wU/sCiYWAX0McMB69Ka+GLp6+XGwQPhw6jxwwvBct7ERM0qlG07ip5d65roPm2NaGMNrlEv
	llYfITIOXgwY+/tSiAq+mGz2cL+u1KOClTUN7FQyw/kS5G+xFMZM8r8yk+CdzXQkXJ3nQRIn2Os
	xsb9zUvOUFmWqtkYkYsa4TvYvKDgf74AAP9Fj87Y3ta/70HljSjUtdDcp4poVgJow3raJgTbrQE
	aE3l8pK4iYFoOcM8tmTUPrDQBhAC3fMrwt408tr9w9gflsrRwNPLUw==
X-Received: by 2002:a05:6a20:a128:b0:25b:b4d0:1090 with SMTP id adf61e73a8af0-25d0a3e47a0mr24315574637.17.1757950923266;
        Mon, 15 Sep 2025 08:42:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtjFVP/FOMnmk7GocafR4hVVB8WkOx3tu07Yk9SEd1JMeAtFhjAi2UPwuAZVhkwKq2woilPg==
X-Received: by 2002:a05:6a20:a128:b0:25b:b4d0:1090 with SMTP id adf61e73a8af0-25d0a3e47a0mr24315541637.17.1757950922804;
        Mon, 15 Sep 2025 08:42:02 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a387b483sm12195692a12.30.2025.09.15.08.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 08:42:02 -0700 (PDT)
Date: Mon, 15 Sep 2025 21:11:57 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qcom: qca808x: Add .get_rate_matching
 support
Message-ID: <aMgzxQQEUOijmafZ@oss.qualcomm.com>
References: <20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com>
 <aMcFHGa1zNFyFUeh@shell.armlinux.org.uk>
 <aMfUiBe9gdEAuySZ@oss.qualcomm.com>
 <aMgCA13MhTnG80_V@shell.armlinux.org.uk>
 <aMgootkPQ/GcdiXX@oss.qualcomm.com>
 <aMgsiDS5tFeqJsKD@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMgsiDS5tFeqJsKD@shell.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: Qt5BxyuI18m8L-4Y1mEQZQHZX2NHE_w5
X-Proofpoint-GUID: Qt5BxyuI18m8L-4Y1mEQZQHZX2NHE_w5
X-Authority-Analysis: v=2.4 cv=E5PNpbdl c=1 sm=1 tr=0 ts=68c833cc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=tLy6ouFqhY7wmLPyIyMA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX0iVuHkr3EZIo
 eSYqPFsaDk5/PCShSu16aiYyRijHddif5h1YeyC4TSrFdlZiCo7iPuuqY7Lklxyhim1fyz8/v8M
 Kf/GmL3Ph67SrphQTSb2yV1EabvzoJZZ1n3Qm0S2yX/n6W0Uf9IpMZQYurTcJrd4doOgg4gj7M/
 GV1JLI9W3+LUQgCgghxgKAHmfv9cyTHPXwwZKi+EbDwaGWwtoBzWkUWZIh6EpzsDbLno69TZ0jq
 1zdPk5OHedPOmQ30AjbTDjneoCzbzT7QUmD17IaYpABOm1guf8LxdAr5LPrqoV6FaxC6pJT3Sao
 e8VmDgrYsTTqZcE0A4WjnYjU4tR14TRVxdq3O577jxSnXVpfbK1pwFtIw8esb74gOEFHLOVTSU5
 bLjCZoJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086

On Mon, Sep 15, 2025 at 04:11:04PM +0100, Russell King (Oracle) wrote:
> I'll try to post the stmmac PCS cleanup series in the coming few
> days, and it would be useful if you could give it whatever
> testing you can.

Sure, sounds good.

FWIW, I tested out a dirty version of the `.get_interfaces` change I
metioned before and could validate both 1G and 2.5G.

	Ayaan

