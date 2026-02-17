Return-Path: <linux-arm-msm+bounces-93056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBcZMREblGn0/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:38:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD951493AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B19433020A58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3D1261B78;
	Tue, 17 Feb 2026 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBgCyxt4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhWgsnW3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B6B33993
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313876; cv=none; b=Tr7EQLzBc3/o/oBcvzxsFhz9KoqyE/vmlvjZvzhjMEyHiA/vfRl3pbl968EqXHSIYyvCqzfWNdlsrXlTJ41NEuetoYCbKAzaqy6OowD18C/XENoffskEtOF0fKuadKZfixfp638zKfXu90PnpOb4TSi7tTlQhs+ieOzDjlFF+4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313876; c=relaxed/simple;
	bh=y6lCjflSgJPPFMmlFO3Pc1EIf3s6AYfeHGJLPlnGntw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wm3QAVQ1uKHwN2O3IxsA4SG9NrdJUo5/4qdKL+UWsFjs34pPsmAzk0AuV5i4kisme2T0BegQyvLYjisJr6I7BCBI9RsliMlbzGQODaFjXvFKHbsfzJOlc7pe1x5jOsn12hKqgDFJxjrgzaDlGgKNLn3HPWn3nXSuwzwD6uHNzvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBgCyxt4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhWgsnW3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H6NaJd3392807
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=14xXQ/3V6vn6vL7UT0TVLL11
	sJ9Z3fyzvo9w13BRJcQ=; b=GBgCyxt4tvgxH2I2F/I6tQMRXhKPo3lYFvErgj8P
	fzylBQRHWsYUuUy8EUKDYrZdnq4wWkCeHlmBqmFU/BxZMLYiRs3J5ngCZHF5H3mi
	Z2uixyxRFsHCnoKxRIVz1oQWp4vBaH1P5Kv8n0e4uxSZ9Eqx/AUWbOwlJRnFDf+G
	BSWpzOvBVCsMUEM66LDpJKtRtTQpNncUcmyguycUMaATGicSHLYfSC1fTLxNPXT3
	52DcoXNW4h4u3u+eKzZExILZOMu58JFNVGGf6VNqX/YKy7q5oL1lu0KjjDTVL+oy
	O4TVvoy1aY282ahicQlH74W4tzlT4eAd+uCJdgu6hdVlYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5kh9qa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a129cd2so2829212685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771313873; x=1771918673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=14xXQ/3V6vn6vL7UT0TVLL11sJ9Z3fyzvo9w13BRJcQ=;
        b=LhWgsnW3QDbe+YCfFcl2FqEaIXt1pQfhY7bR6064VABmrLaDdxHpS+hh+Wjmt1KZVZ
         GWpR3ztmfBApqATZQzaIfm87+8sI4Xi8NlHEgZc50n0AHOfLBkZugQdRkg8aOGoEms35
         MD6vUMAae9/hTRPJ53cWFxtW6aVFH+1wJdqDTH/i+3I5zkAH0AIrhXDOXiapf6Ij8Tlq
         zOmq2hAXthuzDTwOcE1VNNIjUglB8t59M+TKwaO2xx5I9q4Kd74Qy2k/fkOF7FWXLZWj
         W4K16Zs2vbpbBLUKu/XuX+su7UbX1VnV2hNPgdVTk2vR8Mw+mF7gsg5jZ+NipuWJvULj
         K1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771313873; x=1771918673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14xXQ/3V6vn6vL7UT0TVLL11sJ9Z3fyzvo9w13BRJcQ=;
        b=p8VE3z/BGeg2vY9D8f4d++Uu4e+khzrDIPKGBVPW9Bko0KWzFKLd9Te8heQcqp/9Lt
         /hmcAoTJIQtM3tt7EYt8PeDN2LUVE7uu0TFsYqybkzGBiwlVlwIufBUuZojIpiksZjwD
         T861XH7LWCZwoUAP8BAoTt7QdOYpK4ub+EnEzD4THtWbyOzH56iv5WXR/rrS85Cwn83F
         yimYVRxABk877i/7UyAjpfZ/Mq8z2sTEnim7DVmRMpUmDoU5/AMHDduR6pTNjHXdqaAq
         lvfdBkSPTBx38Fq68Wd9CEd60TF3oZBv5sL0olV2gBMVpKyt2HZd/6l2ceVQE9Bppe0W
         P2hA==
X-Forwarded-Encrypted: i=1; AJvYcCW8lzNHFe8I0sI0sjKb4Sh/jC48myU/GuZJU34xKF857ypLPYYOWNWKcWzIMdhzZqelutZ0ruXPlm5JYNmb@vger.kernel.org
X-Gm-Message-State: AOJu0YyhZniXYdxrM0cDktrWJlYXDapnvkyBulpcMdxO+oHJNlCVpdcJ
	cMzo50a0vUZiT+pq4Vez3lpXDKlbtwbVhAJqsE21QmuowwvDgGFACkNfurPQFeB1bG1VATnK4C1
	9oXrvvRSOl1s7v7uWd7cvNSF5aaBDeWQzyim4wYCP4J20tw0xg/NE82OoBvOguXgXUkAS
X-Gm-Gg: AZuq6aLTFDCmRm64PWJxloLuQAa+/A4BSr7JyltpGfi8cI9kl3Rryw1zOCWC57Ws7H5
	7tjWcevuhlNxZNOAvZymJ/u3t6hG7g78zpzZCRii4Gcl0M2QBhIRuk8WH0SN9poRUy2+n2fXUVi
	TGzw7wlsYXV5Sy5b7Qttx1bkuoVyGALf1cF2YMtCoHDzG86Gz+h2mRcVVzF61lqb96gIYg9KmYr
	pl0wd3r0TE7Lw/IGMpRUlthYtm7smmfZKHp5YZxqIfW9z49CWGdIZNjOLLNH4tmapkbrmxrJHen
	O9y5hMgR6PAFWZLgzoxtRxkQXVYJWrjeNwaeoCXNYz0ga8AEGfkk72DglTIk9Sw338xND4Ck2zB
	V/w2d25CF7BFjhBjeVAh1JkM6ncPDw+IBXqyNR5VSpKDTa3hjgg51zWTd9rLkMG2xKS5sr4bCOg
	kieIrNN4MTTSDiVb+xI2FN+6UZBldQddpYANk=
X-Received: by 2002:a05:620a:4591:b0:8b2:e17a:17e3 with SMTP id af79cd13be357-8cb4abd4053mr1225250685a.1.1771313873601;
        Mon, 16 Feb 2026 23:37:53 -0800 (PST)
X-Received: by 2002:a05:620a:4591:b0:8b2:e17a:17e3 with SMTP id af79cd13be357-8cb4abd4053mr1225248485a.1.1771313873165;
        Mon, 16 Feb 2026 23:37:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387069259c1sm35151071fa.41.2026.02.16.23.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:37:51 -0800 (PST)
Date: Tue, 17 Feb 2026 09:37:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
Message-ID: <mxjyobqlpaxhlnbjoef2v774hbim6hlfrc4t4z7noactacp4if@zpjl24dgtxpo>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-8-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-8-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69941ad2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=xTuMNDBKoo2s9YD98OgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: iy3M1FJiUJqrDkqEtgp7FpOGDIGF5-O0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MiBTYWx0ZWRfXxU1mMGFjFddL
 xjhE3jQtFv0ug7EP69PPUkTPYyqrT83xYdOTC3/48m3w2luZtOWpn59dM81Jc0mppLOYAUlWJd8
 29KOXVLO9ucUZ9kRPFEA48rDj74dNZB9h0ZlMJVSTkT0OJzPQAt7j9RBiAKl31/UjoEjhwP/Btz
 UP5cP6BELomHXwtp05qUgJS5c12E+LPb54ZHu+q/ohUoy18Eri7p5t0j9oQ26+qg1PGNZdPWVYt
 EAuy1wCAIXYM4la8QCo57oxfyV0hbnG1EbbQK9xogW/vW34qtwr35CLP5A5mxDRQ1iu+mvV457e
 6KePXPJqiiUN0DLPmglelTZI23Q5GaxMQZBU6qF8C81liBNhpPmIJ5A99UWBdN+hTM5nV4fY5qc
 NFmxhojumJ+DOhvEmUhew5AQeuaLq0cLfcpI0NTYDpFm8xioOJm0akqyAzaOatW/+e+EgXckPMw
 suvpcZBCGu3ki8G7yJg==
X-Proofpoint-ORIG-GUID: iy3M1FJiUJqrDkqEtgp7FpOGDIGF5-O0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93056-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,packett.cool:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CD951493AE
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 08:25:24PM -0300, Val Packett wrote:
> To make sure the display subsystem starts in a predictable state, we
> need to reset it. On closely related SoC (sm6115) this has caused
> DSI displays to not work.
> 
> Wire up the reset to fix.
> 
> Fixes: 0865d23a0226 ("arm64: dts: qcom: sm6125: Add display hardware nodes")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

