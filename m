Return-Path: <linux-arm-msm+bounces-100958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJLsF25+y2mLIQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:57:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4732D36598B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE369304EF91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEA33D3D13;
	Tue, 31 Mar 2026 07:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qah1C7rt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqJkY3j6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1185D3D47A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943588; cv=none; b=E1hgwAk5H5tpIOugIU0suyjc5ISn0Xudx8y0HZgKV+6kD99J/MPDOVPKdY9ytgOqRnx5THyZdpwVfWdr+H6lG0ZnHgmQsCKXMkF17cy5Soai7dJVafp+ipbjRHQIq8LgFL3zgzj5xwL6dTrGjjczwqCnA8Di7ht7atukhajPRvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943588; c=relaxed/simple;
	bh=qTGZIZ5pYHVhTxxT8rY99txvIt8thrP1cyvCU3KjLgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rIoA3DxbDoebF0cJf+lf8DT9fEY+CW5jfmuYIxRmQq0YD3ICVp3x0czZ1qc938q6zOES5IqU054bXwYtPMrAKFeQmF/X2fC9BnewDiIY3niFLUJ6QjoSfZ2BxR9/l0+b/OPZN/6OyAiX285UKXBGs+EfBAeWezVe/ZFFwPDJU38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qah1C7rt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqJkY3j6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7j4X33175937
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcCaNywhoO/yYlctyRM+MkwAPEaj6J1g2KyVaz5Pqwo=; b=Qah1C7rthHdB5Qql
	M9YcyjHF0nmu9PsgUQGTOf4dUkdzbGt8TpqOztwkG8nREfjkY8juung8+rVWqCnY
	3mzSrlVVhwG5kTCG1qIX3pIxsZcCDcnHPCWT6XbEry1yoP/JUlZF0zsl0P2SCKB3
	0e9bGOIGE8kQCl2xXxYTU6HmavGnrrlbmSJvZgHIXzoHFawOaUmegE64jPKyg7WF
	L0aYwZ1WP2nchtw2BNeEBiAe6Dpgf0XhMIlV2uBeyt+l60t6OzpzZD1ngSy35N5E
	xcfXb/rpSepMuUeLe0X5rwu9g/4/+a11k6PGVK+UgAzXE7DMHzJpN3WF98RgiHKx
	y91XSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h4b15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:53:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50943e69b08so19578841cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774943585; x=1775548385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcCaNywhoO/yYlctyRM+MkwAPEaj6J1g2KyVaz5Pqwo=;
        b=GqJkY3j62ApELXbF8WTpgOk3Tvjy5ILIhKSHGf9RTXtytUq72769j6AXhOmwTtFlzG
         ZKXQ00LIYkKeu2wJbskGdnfKFhrjBrXDSY0DVrhhX99Zq8gpdjoyoSuqrdO3D4GTOsnr
         ZQY5e4tb1U9NeVttjcle9pdl4NO3ntVjgROlmp+cl/8GG7EE42epvYIDrjl1tzndJcxI
         lsxvXLgr2hDm6FgVIAf6TGjUGfmDCTwdMjSeOQecmmOxVCZ9g2+ESgzGR5iFDjmIupTz
         8oidDwt9vtQhlGidpo8jfTkJSyh1XftZKuVnvVyqxx6P6BKV9zEkdmvt8eYq/axcPyFu
         61sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943585; x=1775548385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcCaNywhoO/yYlctyRM+MkwAPEaj6J1g2KyVaz5Pqwo=;
        b=nhUyADlSs5qvzg9tSAyGR/eMbNpXqoTqtqOb2+xNgEElaMSlsoYxnCyyD6BHprkKD0
         wutIuTlr701+HBnMk3f1Y4pew8Dcum3s8RPnTOeJ34WEH7boIJJEiOkRok7z8Erf7t3A
         mwsf+aEHiW3sZqDT0jebSLoir+eDcRL1NZLMvHYEHJWTYmqZs2TePnGeWUsIHCdtKAbk
         YIga2s9GvPBsoBgVuIXbD2vSPcwoJUfpQ+7fj0Tdh/cqM/9c4twbA91YE+kkLjhhOsN4
         T3rmnV3AEkadiaoYXUiMMuCUs1JZOf7hq/R2xvbVJqtMia4HRn/IAd9CT9tlgixKl5IY
         wUMw==
X-Gm-Message-State: AOJu0YxtHr+0VoviTAC2QaJyzuT9CTZNnHHVXdTzWxuRyE8ekq33U/DY
	JDh+D0EvPFCRqDFT2nvFlVu7YPKfWxU3l0Dnn+C31oDMdmpISkHzYULG6CftmYkQUoyvVPZOoHF
	wv6LQfsflB9JeOiZIBX5csVHhewg4FjvDNCYiqoLOGPGzXCHrHaTH+MjgVQbNr2bn2Y7n
X-Gm-Gg: ATEYQzzvS732ZbnA9HRkWndHbLx4oScr37u2zpZO77482cBoE8amfsnr1X9LYP6DbfH
	UKymdSH7zYqHgh2qzhQY4PXcU/nj1KA+XkxSuMQfUZXFnvLrV4oZbZRy8n4opZqrzvv0aPJCZ1J
	ILnehMlNnvyp0mi+8TG4bnZ1eNH8GyBh3b2gkESGBpf+dZZcIInbO7n8vGjmrWxHVxPZ1SLdt0J
	UdglCURADaRi7gCOThmi0XRcFX/ISPmfSruDvy8cZnKxleKPRGRiO6Rmd/9qAU/dDBOgM82yBtP
	/Q1URmbPjHxKkK2JCEw9mNHBLpeox/QVD/lLFg7iptirSUrJaZL8SODOkmURVxw+bUGcJHTQGTU
	ia496P/Hubb2ScRuFeKjxLTkthMmHp152aH6zUWJcLKyEO01tnwQVx9S2nTH660cZUQvindr+hV
	ZEsxw=
X-Received: by 2002:ac8:58d6:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-50ba3970c85mr156759571cf.5.1774943585380;
        Tue, 31 Mar 2026 00:53:05 -0700 (PDT)
X-Received: by 2002:ac8:58d6:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-50ba3970c85mr156759381cf.5.1774943584944;
        Tue, 31 Mar 2026 00:53:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a6744sm366425366b.30.2026.03.31.00.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 00:53:04 -0700 (PDT)
Message-ID: <28a83981-557c-43dd-aa7c-abcce638c2c1@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 09:53:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NCBTYWx0ZWRfX2m44tO46RFwD
 clCH7aJObrgZa5GHKotCsQA5KD/ALkydKiit7dUA2a82ba7nEVz91tnWl/a0PHpTGhqxvhe1K9L
 kIIVcYDovL+m4+LjzC6U4QIitQUm2OOx9+FNgECeTMppHQh/aKNjOXoY1cQgdb/8VQVUvo/Y4mu
 Pg9mWp4p/wdA+n0708nB2WWLYICLyvWsZ/7jeSuUAcaE7cyGQtOzuucIjyXjzcKYEube6/t1Dnu
 /GkuNvssIKF4SYGkd13u3YEiEYXP94brMvKt9QHNDOv0Vh9iXgx863qhByjx73R0ZeHn5cna83D
 gLynu1OnoBhcT8PI5gP2b4lkPaB2ILWrYSGeiqmPhGIPa/LCZ1v1DRpVKmYdUUVp4p0wyKIjtVX
 A9+K84yoD1p6do1Cp4yAGAOPHhh2vL9Kr9W9j7vIhpWjWAzKVrDjZPJmpCt8MAKpnWs1Nyp8OQO
 h1ZD3gQDQIFnCWF4ZDQ==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cb7d61 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Tay16fmJ25vNEHRVOVMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: EyR8ixAgBFlyPn_Z-3FXNGdmBmfC5bCF
X-Proofpoint-ORIG-GUID: EyR8ixAgBFlyPn_Z-3FXNGdmBmfC5bCF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100958-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4732D36598B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 2:35 AM, Vivek Aknurwar wrote:
> Add clock operations and register offsets to enable control of the Taycan
> EHA_T PLL, allowing for proper configuration and management of the PLL.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

