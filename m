Return-Path: <linux-arm-msm+bounces-99734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BosOqn7wmlXngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:01:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4681031CA2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ACA130DC6CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAB235A38C;
	Tue, 24 Mar 2026 20:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXOSmP3B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbS2J+c/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779643590AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385752; cv=none; b=PSR/wM3qES4TXYbccxxjqYrsVWPlDqGm9sn+C7JzYNwyt6ugHo9hu/Qw/Vd2fAZOio/tg77S1quaLaHSfcdBayHqYcNsp6Fz8ZlnV6ok8DEjtdjyhh69fW3yBnLCfUmNQD4Z9Its26dcHYwWC+ulXTUyrBTk+w3ImLWzjW/r2Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385752; c=relaxed/simple;
	bh=Tip31mtpSyG902kHENlZpUBHz44WRarDwG5LFNLqsa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdbR9nlasfo0DCzBQ/tuPZA1vgWf2e11kM1rp8yxk/Ib48Ynyi9x7yoPHb+o+i9mAIFy6wADDw9osZyCmDDLEYiH9PMDqR+eEzV9EQH2/5xIpghMH2Q7RvFz5n0is/79iVctQSC8FME2BTH+eLUfKAoQrKswX8sCL8olA1tf6e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXOSmP3B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbS2J+c/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCtka2807986
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hbtb0UBOQpzjCA2lgujpOQeN
	giW6uz2MkjiqB/qBQTI=; b=aXOSmP3BXGYuPXaBnQZarMxzr/EePddfClDumran
	keoEzSf/xCm9rcUkGxdOF5dW4es4dvYzZjoNOUv6O6s3CjohnUJCv1MvUSuVBeLS
	29JWZroXq2rItavr8KfvRV6RVD9MkqyL6Gr4LSx9G1JoXnXnVdc9FbEVuc4cvpQK
	GSuXEnXewWDG1KhrkdKoLaO1Wd4pceSYOxodkPymXJmX+GYVUeGSy49KUtiMwwHI
	hFUnUiwe0jueAeM8w8BSugusHSbQW+IQNwCNH738g7oEuPjn0pINuZ8J19nZfrKB
	09J//R4ZIzxqUawjJ7P4cJnKsV5dy+U8cTOpXa01Ju8gow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ej2pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:55:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509044f54aaso98713791cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385750; x=1774990550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hbtb0UBOQpzjCA2lgujpOQeNgiW6uz2MkjiqB/qBQTI=;
        b=WbS2J+c/2Nx1jvJ7viy9v8Qab6r0ZOF7dBuMoE+qdX4Wn9EwBJ1rBMQ0JeCUs6t1PQ
         PyruRm1owvPKk9i8KNX2NYt4pklNjQz56ej7E/2hQJBbr/FENEvt16GEj+v39e+crN/5
         3LRiX7gNHNjKrxVHrOTrgrDz3C7gAlw+ok+wJwE+fXzQYiYvYSME4K9av54mq8vRhv/d
         ELc1UUPgJOVviA9RPijiM5EXpiv3xTn2BpYRjQLTTMX1yoykqmhPytrcu4d4e4Ts5PDJ
         yogIK8RyQOfkHY4NdThYJkegy6+sRy4LZeRoVkkS13nIrT1U6iPubQEWpKWfakmrl+TX
         dixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385750; x=1774990550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hbtb0UBOQpzjCA2lgujpOQeNgiW6uz2MkjiqB/qBQTI=;
        b=inS+HHCEIHmxFxsBhXP4rTsOkEV0Z1/u1Z9i7e09de1bJDOqZXHTpyZp2zEK9DWYkr
         izwrhs+V3cDNWwTdER9X9CQrf96eMbVLy7byWyQgSxldXQ2T/aCHuT+q9kNyKCLn5h+G
         QIPxDLsn2UOjFaD6sofyiLLxeY+WMI+aEFjuXbtvhlPjGS+bJOvrnhf2v6lvdXBtAWlv
         Iw73UorYR1Yun94MHeYfDdB1x7YK6911Svd6zJdQTLnKTxWaYSaimHhfKXhiyQwBYHjK
         qFe3b2kFAEavxdjLWNpYuM5U/IdQiMee1w2SVn0mdMYsdLpjHPjMtVu57c62FGB6+PyC
         AT+g==
X-Forwarded-Encrypted: i=1; AJvYcCVWtIU6G55bvRCgZcxVdlh9Uv+Lqx38sNVBFgLB4NvIhESYkGCzYSUtsGfXoa3zKQzTmPBmEIRvArkcttwb@vger.kernel.org
X-Gm-Message-State: AOJu0YyFwJt6R+K/df7yXclKrBIZZoEcm6FfAWvLR8+kJtnzLuJ5qSNE
	vQnsaVH2ID4CSiP/OKxzeDff3TyKYyYot8mG6UlCRs+co1bF5IliRmQPT7s39FrdeXnjEBUlii0
	Xkzg1RaXhtLMDW1OXLtz10kerkSH5rzDJ7Kpeq22RPtdEpmqCp0SvtHgwbavQsldSOFN/
X-Gm-Gg: ATEYQzwxCxqmh4ipfIZ7x0ITdwPZZkscfpouBOjgAh3FFeNg85hpC9hI7R7fUvDO2f2
	fQauBBvvrlGF/BhrdhumGTfCp0ELOUKwajeoQtpERz8yvtnrmTwDkH0bmsHLxZn2594RLGLc9cO
	w7gWnxehv0wRWIJAr4ihHkl6rLJlpt2Lx2/PkBWlCex78wFbKYa4hjl/K2xb9PhekLGdT79UoF4
	KsYghZxnbr9hoW00bXeSeA9pmIWmapVWP6W+7RptRry2XsjwfMMSLYWMNpNF7E1Q6HPor6QzUU2
	lTgozs3ZzxvpOjSCTTujGYe7jyiR+cQ070J1VOFpdWCoVrJhe+URuxj7N81IxkFya6I1+rDBg/j
	SuUs/smrGQBXd4Kr+1R+9S051627IuAW5Y4jvqpQ/dc6J4oeCuwIEmJ5ph7fygXtVrRwHdqzw1t
	9xR8scu/ZpoVKghWqCHbhQbP6VjlLd6jgeAD8=
X-Received: by 2002:a05:622a:1108:b0:50b:3ecd:ed29 with SMTP id d75a77b69052e-50b80e4b391mr16993731cf.34.1774385749782;
        Tue, 24 Mar 2026 13:55:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1108:b0:50b:3ecd:ed29 with SMTP id d75a77b69052e-50b80e4b391mr16993271cf.34.1774385749275;
        Tue, 24 Mar 2026 13:55:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ae39dsm3380929e87.36.2026.03.24.13.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:55:46 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:55:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <vjf4lqbd5igkhvonxed3tkydxkcc5rmt2hsefng4oojrpzf3fc@a5hujilezcdy>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
 <e833f72236342a7efbce04c2109bf921f770673c@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e833f72236342a7efbce04c2109bf921f770673c@postmarketos.org>
X-Proofpoint-ORIG-GUID: KTAPXE9OprJNBZa6GXCV_Qau_lfXlEn5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MiBTYWx0ZWRfX+MZ7Zs6RgWJF
 Pki5HTDdD56n+4iKDvm2TpHepgo2Dcq3nW3t2hsQXMxkZefpH8TPmVxkbf6y9nwm4xG/XIfc7hl
 QMqQ/mgcPRYFJDNht6ihZpTwn9bjnG+Khd/ZM9yHVZ5Cyb7M3pPe1UTUzeeqn8abAlCNETKCANT
 Noq/CHTjUCz6O4Y8xi9CQR57CvV1qLcy3Y1uQqxkBlEpXHtV9pt+JrbBx5znrAcsOrvFqhnESvJ
 xvSALtE6O76dpiL84c21d6j5H7jLeqpwR/kafCXpSbkL4Mxf9B6UsaRZd4hyEaVfnUuj1n4+Kas
 N/b9zYlT3LELhUciw2jQV8AM9bgLCjK9hBpqiITYRD1lnyiYZ5IEHrloC1XzH104A3nw4DbVK0s
 SDnFPw0IbZPbiY+K4VLlWiCdH8ZGwsJhQcuS24dOGvJLW9oKEsfv3YSx+fYVG2Pzi3NhzWjfwhG
 9thpzp/RKRzYByIW4Yg==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c2fa56 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=XKEg-W0rSRFBAHshmuIA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: KTAPXE9OprJNBZa6GXCV_Qau_lfXlEn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240162
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99734-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4681031CA2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 04:17:09PM +0000, Paul Sajna wrote:
> March 24, 2026 at 10:49 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> > What about the other board (judyp)?
> > 
> > Konrad
> >
> 
> I don't have it.

You don't need it to define firmware paths.


-- 
With best wishes
Dmitry

