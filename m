Return-Path: <linux-arm-msm+bounces-96853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NIbI9XwsGmvowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:34:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B23025BFDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A02B630614EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515E82DA76C;
	Wed, 11 Mar 2026 04:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqzeQnwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XH2uDLHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2BB126F3B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 04:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773203662; cv=none; b=kfBTRpFJjzsDkCaw+Vt+4R3W+16sJ7bHME98g0Y1ALyBpRfKbbXsgYJsT1JKNnFRM/Q7b/jm+QuL85bP3VYb7ZoFMXnDbwhYJyo5NN+pKav7zQtycEikESGID+/sbToLa3XuAYxxt1kHzD5O1jLMr0d7KGOPZg+wRTm2CyCflM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773203662; c=relaxed/simple;
	bh=neA/FZ+AYBllqlzGOOXQh6KUbKll8tYb5T6eNjwp+sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ewbm/z59Pgu/RQncOf4z+8wPnb8XzIhO0U+QeQezjghIaeaxzJGU+mEJbd+/n/CkXtNDxy7quRiiT6c2LyQnYYZQJuHtsazriXxIDvgF429WGPkK2YIwpP5NWNTIvCu1jo9Cm3h7zhIlC+FVkc8mUiCNBKQIVrJ3DG6SNwonyco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqzeQnwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XH2uDLHc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3BNbh249197
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 04:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IAEnTRYw/IlFaUhH4dlZ+QDv
	SvN6JKUiR80H0qgUghw=; b=nqzeQnwvipGGuFkTnUjHxgXhXw2qhXXkt8UcQ26z
	JM/xWgxbVcWCmMxPu9ZhFz1cS/Z03znZXLFGBiR39UAGb51gBXGZ31IfuxhWkksf
	mm13Cc6mNE835lR1y4RPZ+JPsDUhgSbmlklPVrXx13uc7KHGjmFTpufg5Dg5m2HN
	yKXh5SNxHNZ6Rc6MiAW6z20cLsn3mahiNrKTRro5b6qD5imKZBuNiLVzKr4I6Alt
	0iYzWq/gMKC9p6RduLfwFmdA3s/ccQDxMGYKk5V4rRg14PAxq3P2i9Y3aolmG71h
	1FDC75e4Mbj1RoYEF2YjGf2jZGyerw1x75VRm7uqKDMVDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv11v11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 04:34:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso11038102785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 21:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773203658; x=1773808458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAEnTRYw/IlFaUhH4dlZ+QDvSvN6JKUiR80H0qgUghw=;
        b=XH2uDLHcWDFCTUHe/lEkhxk7qar6VtGYglPZx9NTOd+JzRI9M++WqGvFNgWqbIfNrC
         M0WzlyDxbT0uyhaW3fgI7KhHe5ch4KGCET5pZp0o8dZk+RG26CS0zIjtShmt99Sa3jB5
         pQvDqiz48T/BNfd/w61Fy6W9RyZnk4DV7S6BYhsvs+FpiJlFwT+ATNT3IVAjOey15sRT
         asg1vRAJ14DClc7n6b3hdKrTOZfvaJpaKEjvp83gMIOJZf7pFJA9tM29V7Be+h+CQKDP
         M687k9rJ1Cs9sQQId8JOp/NjyMl4ABlI+wQlHyCf0OTaYMnSPzDVmao9jOAKTJv/+Z6i
         vSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773203658; x=1773808458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAEnTRYw/IlFaUhH4dlZ+QDvSvN6JKUiR80H0qgUghw=;
        b=c/pSXlMJvw4vViGhZhq74mmctGeF2jxNO8SI/BxA7U1lN0KdK4/qSsCgWPt1c+GPAe
         HCvBvmwAxYCraFBdwscHLeyyND75xzWRWGwiWm7j+hirT4tS3NLflKl/HVusT2MI9620
         yBWIBAnkH30hXWCEd+iOLsx1pGw51aqreZfrpoJPfavPVz3ypVgx4/UAZ+5BZHEMc+uf
         RcEYy/p/1VyNn8WJ1mKyrGto9UdjqriIt+h7/kbsU+ov3aC033K2FugKcseBScOrclVG
         Yw8AWGWaf5bWAZvgc2ML2BTKg9SCZRZslc+0YG1tZ8aYwQ9/O4yVtlA+snVFXagcIPnI
         Df3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCIVZAcsMn69DAn+t16xAZFsh34jzvBoYQ28tn62skchJvSssbYNqPGqfAEoS7fQ9vy/2YxM+dWNBjUvQY@vger.kernel.org
X-Gm-Message-State: AOJu0YyUHjxhxwWYlWTbeUXAvMnYvTLmAjEvMwVFEhL8Rnpfqm3b11S7
	8+gzAiB599c+1+ZwRPO0xRwUk5vlZle1ztjklh87h0MFvtSZp9gkSvHXWjdr3oph3yEIMzzYZsT
	nGhqxXdf+4a6UIzUrZwi8PNmW3PxCYSNuDStYArsbeqa8AlgNKjssvXI66VeTiEI1Tef0
X-Gm-Gg: ATEYQzxTGm8KeXYtCmfGil1kWbZ7vK53Ba3qnU56bprHEBSO9WriJCdv54dI0gjVllo
	YTUvzwNZK75I4hp0viUgmUHTbHzHJPGE4zeAOUvlZruA/PcawjXTnbB7pQznAUWboARQczvl+cL
	BgQAbjHJ8cIWoZ52zW5X9pTVj7VmMf+ZAD0PaLeS06lnaoLQIPgnD2FeYWWw0FrzdkJBciPWywU
	HlRZAsOsU4R51QUZAFd8ldLkiclx2GZAQ2tjqUwRnHGHs7irrL0oMyH3VOixicJSURUpRFXE0rr
	/ApmSnNE5u2i80dNtyJ5mHCQw/HoyPM5M0mY928WEOUWt/fYGQc2yfRjAEXIROJSkbX2tB5lA4y
	vBo8Wgsxy/RVrFvDZ26YNrrKv65p3IOTFT6pl3tTsV6esUcbUAGi+eysOkFrn7UPWz9frK+Frdh
	GTPhA8AhOpvJQK+iEGL6NbXUX+uMP8cyQ1Hgw=
X-Received: by 2002:a05:620a:4103:b0:8b2:e058:de83 with SMTP id af79cd13be357-8cda1936221mr169272185a.15.1773203658207;
        Tue, 10 Mar 2026 21:34:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4103:b0:8b2:e058:de83 with SMTP id af79cd13be357-8cda1936221mr169270585a.15.1773203657776;
        Tue, 10 Mar 2026 21:34:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm183593e87.61.2026.03.10.21.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 21:34:15 -0700 (PDT)
Date: Wed, 11 Mar 2026 06:34:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: disable WCN6750 and WPSS
Message-ID: <wy46mrybpvnicmv2aljkyh6lu2gnzz4axl66r2efmfy6pr55b2@phsj7pghzd7r>
References: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
 <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAzNiBTYWx0ZWRfX9tKJWOGdqTGa
 46R2oImczzG1b8gRB8ZEP5x5Zk3rygv5ftpvikPoxK6gkTGMYk2X8Jm8miHkEGpDSeJgYJEpIDS
 h+KNl4q/wH6qk7o0C6ZdAIjNqtr57My0IJofM36X3MMTtpLWOaJZ4sTkb9EvDiuW12eCDhqXHXF
 CpSX4LwwxHIBMGJZW3TQvXfsuYsieSDaBbrXzwy7dtpjyWX1MtyYli+z6q+6goDs0Szt75oSStj
 3dZikRIpv5yg/3xKGoi9KakvypsZoPWwGflRFBwRWnQFh7UhPeTAJfsr98/Sjbc4uykFsCv5aHf
 4YAAitn2wpGDR5yLxudi4oiFhpvEUHEMy8mr3KsPe+NN0DM/5w6oNnlwKWptTfsGmpHW5nFDFyG
 uktolrDuQ+ZudaUY2oU/M6TBabUxFJvZ8uTRj+3WTRpKQBgKlgoOJP7HfuzEMN2pSyY98QAatS+
 ggxBiBhCIfxT0RrOFlg==
X-Proofpoint-GUID: T1Be0omTm0Bm54QFBPZ_hfR5tHS8IAFz
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b0f0ca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=28zw4h3IBKRfjoEwuJsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: T1Be0omTm0Bm54QFBPZ_hfR5tHS8IAFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110036
X-Rspamd-Queue-Id: 0B23025BFDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96853-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 11:11:45AM +0800, Hangtian Zhu wrote:
> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
> 
> Disable WCN6750 and WPSS on industrial mezzanine. On RB3 Gen2 industrial

You can't disable these devices on the mezzanine, they are not a part of
it.

> mezzanine platform, pcie0 lines are moved from WCN6750 to QPS615 pcie

PCIe0. How re they moved? What triggers the move?

> bridge. Hence disable WPSS and WCN6750 nodes for industrial mezzanine
> platform.
> 
> Depends-on: https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com/

NAK. Don't invent non-standard tags.

> 
> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
> ---
>  .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry

