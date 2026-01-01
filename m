Return-Path: <linux-arm-msm+bounces-87156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F5CED46A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 19:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C52CE300ACD9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 18:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE882E6CA5;
	Thu,  1 Jan 2026 18:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6XRqEBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkDp6+gB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9061A2222B2
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jan 2026 18:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767293746; cv=none; b=Io/wUxbGWJ7KiMgiM+ZkQCwLkDOaB6npuc9m1+eC6QhL5KniAcyzvCeSxjCVOPiaaMi//VSKHuPI3b7jXEP23lvXxQ0tcDGAoxB+LEOi/xJUh6+n6I48/a/Ix+lptxbn4K4Z8LYF4AiyYtOIkdhGorAvqSMpsREwdPoajEaUiWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767293746; c=relaxed/simple;
	bh=BsHbCL31zaCsSjy+gR/aV0LOVFxYgDWTaTyqMVziIck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Phx5cuAerMp0dzlAJnk9vU2jBhB9fbfvtYVplM9VMcCHmmfIMtJp7+MInn+CjFA4+DetwLw7NUzDfab5YR+izwU+3Yl5sw+nQd2x5iRzf1Bg1Yran3jSHGyziycL8lOd65b1y2/U3M5RR6vqhXqiQipmA/0vlwyEvjYtv20y6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6XRqEBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkDp6+gB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6014pmpv1046916
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Jan 2026 18:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mJDBD6C6FOpNftcz8V52aQRx
	AwwFr6Nbn/iLAulEz4c=; b=D6XRqEBycoPfywrFAJMOwk0Td+BVQj6fDUJfxnGS
	R3ROIporwU3L5GF5iDHGxOWrZIN1qZTLysreBXAyBp2BX43nWUDLwGRQmeIlYdqH
	5Z6a28TE2AqARWhtHoib6vRkDZVkKY/XzaEcGaOLaZmiNcPTWx76ZUrs1TP42REV
	TPCKEHQLq47czWMkWNWIulVH3P9APWdVdYlL1k3iJZ/WEULiw9a7bU9DwFN1BGoA
	SQ+DsGDQNEzOBlne2OzWiWOUOF1Ww4EI08YNPLAAgXGk5ohX7C/zizexcL2Ktttl
	1i95KkjLxPt2XxZV1iK1VFNsxm/QUJYqeHPcgxLrIUuEcQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77c9wwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 18:55:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edb6a94873so226296821cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 10:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767293742; x=1767898542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJDBD6C6FOpNftcz8V52aQRxAwwFr6Nbn/iLAulEz4c=;
        b=BkDp6+gBegPOL8jynqa+AcKYjYMif9bEtspAEuP9Tc/idGOuTPOT9hQ/A67wFHcE/d
         wNhmAVQkSJA1+e+QVlrG849ciCWY/KZ6Y60naEMYDhgw3trbEg5brol7dHNJU0KwJMmZ
         WXyALzytQkzWEbGQM2ZOVgUA5oZd9+TgDRz0bLjMBgmpebs5dVDcKzfYkn7WU9O/52PH
         JPBCPKJQsKNiIJ5rIaSQnhOX+VuOo+SCQXhYwtD8JLtEiVMb8QnHONbPXKj+lUr1YBg5
         5zzSI5UAq7J5d1sKkqjuOwb4W+6KOIqMfkATRNtpcwYgYDuri1VF1Ui3my9cm7orEtoD
         KVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767293742; x=1767898542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJDBD6C6FOpNftcz8V52aQRxAwwFr6Nbn/iLAulEz4c=;
        b=DBV/xfltGj03L8G13GUyKcmS+hi+dpbrmv57E4Mhw9RRhtUJXHn0yvjTSFbQZ1I4+C
         x1PFnimvSWCnTYnznb9zJHTO8YfJHbMC7S1aKnVcXLxvef9Y7RtQMakw5tvGQvr/g3cQ
         jihNxfRHam+kZbwKysnEWJL4F3HnGvM10LT8gLvm2zIaH9xLcP26trw0kze/z763C75s
         jgJiCy1ylF3WDaYOeldzGxvgs0z4coO2x4biDVihGFVTgPIRyQSX4dAJdxcWRC82d/fK
         goJ+y3qOr+cOrZr/ratDJuJGE1R515yYaXr+caQR8HRbsOAV3bwFGpYb307xdadcA/yU
         //ew==
X-Forwarded-Encrypted: i=1; AJvYcCXWqNp+ob668b1XpxvE6qUa9/3HLDram2wCoTZAeqOg2+wi17kgXi8Eyhn9/TXsroLuphs2Y9WQgb4QqG6K@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3PASiBOGyIvuWZMyQalsrMl//WBKjiGr4GUpgsl7mYKFLHqK
	DRt2JLI5P/YLIevNy/DNLEt69e60v0nkliP5TYNNUB1LFGrSdVEeHEB0550Q/DlRu5pmS5sNQJQ
	YEWFVjDYR+f6iS6vNTug3ggEefE5vJpu3ljEoRrEBWQ4QDku05a9FnqA1DsocmPMV2yQB
X-Gm-Gg: AY/fxX4+FCVBMbWxdnkRvE22xKKlLrrPuYqI8L1JwAA/fHYrHvGPMnkhIK4fzyhbMLg
	X+XBXmgJCsUkAffIZhFl0YkD/lEN19PKoGgtfAnA6hozPpsA8TSfR6amqfNsB5D5Ee8zsYunCPI
	Z8rwlHEWf5GZqVXPhZw6QnW6vp0X1QpKs8QnDTAy+97mDGs1cWMsBG0LatOedJd3cxlQGIEY0mJ
	UdWGJeF2AWxsp0fiD3DywxU+rxtLxyz6uaeFXHtYu2kxoic/h3jbVdgdnFGZewbc2RVxxh4FR+f
	pX4ydJ+l08G5qpWQ0/vkCitZPeDOmjZHNyzXVtSCg28kZTyli2pxUqB2OGwPovtDGRlGMrESRsj
	T6yhnMxjDOXs8eWqMWnES
X-Received: by 2002:a05:622a:198b:b0:4ee:2074:4b6e with SMTP id d75a77b69052e-4f4abd8cc2amr520843881cf.45.1767293741747;
        Thu, 01 Jan 2026 10:55:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMAbbN36NDUCpPhQ3JWoVexrYcy5eDxCWj72SmBlpn3w+//Rky11IVt9UffX5P4zBC9TQvFQ==
X-Received: by 2002:a05:622a:198b:b0:4ee:2074:4b6e with SMTP id d75a77b69052e-4f4abd8cc2amr520843631cf.45.1767293741267;
        Thu, 01 Jan 2026 10:55:41 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm82585080f8f.27.2026.01.01.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:55:40 -0800 (PST)
Date: Thu, 1 Jan 2026 20:55:37 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: hamoa: Extend the gcc input clock
 list
Message-ID: <xoehtndy4et4axedhpeeqhpfph5jom4jqvl4mrt6obnv7azz73@53kxqndkysae>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
 <20251230-ufs_symbol_clk-v1-3-47d46b24c087@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-ufs_symbol_clk-v1-3-47d46b24c087@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=6956c32e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=q0JkR4NhiA7wQx93E64A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 898ilz3FEESnXhfNX5O-_FtcZ6Zn0bIv
X-Proofpoint-ORIG-GUID: 898ilz3FEESnXhfNX5O-_FtcZ6Zn0bIv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfX/4Er4DmiBbfJ
 DMyQwI4OxFTAM+gQoL808nzcZu3vSJn1XYg3uXkjkT+T2oh6o/6B9l0ws8HmOy8NR7WOtxuYEQC
 aHoMusYty+NoPrFRDBevmub98ll9ETp/mqawXwHfbhZK8XfWmfpUS2meFR7Ykw9UEbWzRvev9ik
 4fegpFJ0HaNMFPPBDiwLPgM1C/4lr0ZpHCnDLzZVvUu77JOYXLKgT7QJZJixx7ph7C4EwFIIUMX
 NFEuodLij34NF9bJAH6RTdG5kGq7Nj8eOA0iWTAdNBhye/dqfjvWFFsCzqAdNkUu9QKOMMQU/R5
 +yz35MWyksla7917bBI5tVErRhNqfNzBMFVbcB0YxtfVhv9rxRn+N90JiD3GEfrDGRmJi7FN+nU
 /YemtciEAP4qJgtkPIvInj1avc3ZkBIE7E/9lB2kNlutHBvTOcuNSxaoiUJHw0jCML3CejEg5WO
 dkyLZ31G/lGQcS4zAQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010172

On 25-12-30 23:08:36, Taniya Das wrote:
> The recent dt-bindings were updated for the missing RX/TX symbol clocks
> for UFS.
> 
> Extend the existing list to make sure the DT contains the expected
> amount of 'clocks' entries.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

