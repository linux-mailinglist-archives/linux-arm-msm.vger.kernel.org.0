Return-Path: <linux-arm-msm+bounces-97487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A0tOZcJtGlvfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:56:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8805428355D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F33BF301A9C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A9229E116;
	Fri, 13 Mar 2026 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STQWCDT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZymwYWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5E2145A1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406613; cv=none; b=B2dw+YWglPRTmHXtjSqw/6vm4M71rH6jGn2dwN/ajG/osyfsrDA4KMfqOBxCi1972me1oD0xsU0PobGwHFuvvOg/51JPLXMI/zSbwiV/ICcTi+WmBKtJvORyR1S4RM2vFW9/H0HGlvbE1VfBdn6OMGD5Udn8DW69Kl+JISlFyF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406613; c=relaxed/simple;
	bh=EzGDbOHyLywMYNWOaaZE2lluZD5hwg+rVKfYJ0YXQLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OaCESbBsBxsZwGwtoyWzB7AEQYLni8KTkXN81TShlH8Ly0B03JIek6FbuX/m8MIt6g8vySybHhsi0yhHu9YqTxWGOLrnMk/ju5zJ97iAQhTp7Bz6HHa3rDWkGxAF77sk+kG0reZ6ncjkyiASKRJyfG6ZREs5YOZUxnuV6er9zKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STQWCDT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZymwYWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAsZMb529547
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bhrco7TKRrzpMs7dRSA6x2bGIqPZK6XKhh9qpBBTMwc=; b=STQWCDT9Hehj8Zr/
	/FROeHfetK9Is7uNcCwKgPpHjg9RtqRi2dFOK+MK4FSgXF9uibEp11G3IhWuTPbQ
	OgLaLAEL9/zZlYA2THUwVQfn5otFjv51MNC6Sm5jTVMQQI8RZFYl4AeUnnpgoKpH
	MdJMocSPDHtt2Q27KoPym5xlNur4ZxPsVA2GqZoc8Ys7TQrU1QzPM0CyBUl2PQcT
	JyYUOaqX4mXqiu4YsAbHgDt7HfsqfcMIrYFP6qaXs5RwXDG/Fvj2ihY5wRoyn4q3
	GhxdkjN1mWZe0hFQNpDwHdfMcqPP58D1joZ8qD0deLV7MhtTT88fGHVzp/NrwEkX
	Opmuxg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh84rbf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:56:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a012f8ab7so12293366d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773406610; x=1774011410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bhrco7TKRrzpMs7dRSA6x2bGIqPZK6XKhh9qpBBTMwc=;
        b=iZymwYWy8F3K+jm0Wmkoi5kBHwwDcJIGO2ROO7HpvaBJu6Wi+yQZ6WP3pKU9RvP0to
         dfgzMnxj16Yue0Zm5xWWjUBR1VxD6UffyEtsG1L6xnxwfLfSfLaEqDoJA86hCk/WUZHN
         ECth3Zrf4ZjYZ7kEZgdDEwD/MKsYYfEgiP0lmgMrD+/GMc5zCqxAoxHkevHsJxBLP+28
         XdaUIAP0rktSrGD1ul695NesypDmyGEqyG6aSXQznvuFFmIfVZaro9yX3ukUP+fDUHlL
         Iyb0rRwvpRs4gjRQRhgWPPuujcZYl8KVgDV2bbyPpsfIy3wOpxFtIdyAF7CNskqhTBOh
         /hCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406610; x=1774011410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bhrco7TKRrzpMs7dRSA6x2bGIqPZK6XKhh9qpBBTMwc=;
        b=SMwiQnuF6It00C768szGn3AjVZ3ixUm44RorbUUrt6Tcg7WPyKpxaZjhrs+jMqYYeC
         /5HDrY7JrKu1hiXFKMRBrV9T+mWWhh1bboq8xKucJiMjeDWXgFQiPr/flKrtsVc0hFmo
         vmnLHZ5yvp0x1FHKyZwnxU7F9clm3YhZSYeeJ8IJaXMSl/MHR1XzxD+xJtQD5pyv4TY4
         FOGOlPO5quH2z9tLrF7u9NaYfQrS+pVupP5UNbz7gMxTdXwCCIjiF4GSYVK57dHPBMzC
         Uf/5wpBWaoFCIw315FqeOZkZY/pWErcUb4z/1OC+l3NwBSY+82KBJ8q8ebX40ce1NNqI
         Vhgg==
X-Gm-Message-State: AOJu0Yw46Z3wSU6ufyFpLcCeJ32irxLEr3W4/Jw4AF+cJ83TGx7zww/l
	xc+E6azY1WCqaysTALQxZ7yRUE42BJ1BUVgIoqEz2wp2xBDEb7xhf0VtdWkCe9a/zJU6pNd9hb8
	7LuxbPzL7P13WoIbD4zKU7n7mQTZpCr6CM914nGjvskWJnOsYAl+kqVSgPBzXZ4XnPOya
X-Gm-Gg: ATEYQzxsF9WSxz5kzUPG4T1R8cHe4K3+rXXpQnq9hqchKy+DMUCcy513xSc9OyFf/A2
	m1HcWwwc5lLPIvVnaX1bkcP9Bse8Toy46cn5ccYCaazzzvpLsHUJxFCRYPhICI5HmnsrBpIOar6
	uQafIdLIHSh5REmc42p+krWMwcYeIbt4meBRzGqdiPo0B8hfwsDiLxx6vbT/BKYYV7C0BcWMGqc
	r4lrmZt2IFZXzLmf0G3kqCxf8iws8lHq3kVlBW4iqKUIxR+zGfTIiDtt89s1OSyeu8vxd8ts2UM
	We8bfbpPgCUP8S/7/SOdkXZgaX4GheXml3gkAlrtBYHmceKLt6CVe8wuSOmW56YYi6Nbh17fQPM
	QeZj615KvGPniszm6/zV439xVsKRInxtxyv+gSJ7/NyWJD/h0WtIaHQmkYznETMKvPS5FNkZtSI
	73Flk=
X-Received: by 2002:a05:6214:5e07:b0:89a:62e2:375d with SMTP id 6a1803df08f44-89a820fe6f7mr32687026d6.7.1773406610209;
        Fri, 13 Mar 2026 05:56:50 -0700 (PDT)
X-Received: by 2002:a05:6214:5e07:b0:89a:62e2:375d with SMTP id 6a1803df08f44-89a820fe6f7mr32686786d6.7.1773406609742;
        Fri, 13 Mar 2026 05:56:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf02b36sm44933466b.50.2026.03.13.05.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:56:48 -0700 (PDT)
Message-ID: <16501e2a-01be-4009-adf8-278f3a42b040@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:56:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/27] drm/msm/mdss: correct UBWC programming sequences
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
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-1-b7e8f800176a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-1-b7e8f800176a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OMoqHCaB c=1 sm=1 tr=0 ts=69b40992 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=g9AtgMIdhz7_Ts0mvgYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMiBTYWx0ZWRfXyqlNBe6E8sgf
 n0BxoKI51WdsTAE5Zo3stlUsJ5lGZDeJJfv0Xq3j0xExc8rA2P5uGi1ahmjFXylM6xoOiFc/Cmy
 LcsH3nPq89oWqBI3C1kaRekVjfVVJGN1+GkoSTmVtPXwcwcWQFK/1Xut1Kpfxe50NvNzhVdz4tG
 0uM2BARw0iFTV43HAG6I6Igtx4/u0T6RBxsTSdSHF6mkhL2OIybW6xtVUv6/6eYp2pBL47YfxCw
 1IoWV7Jz0EqnwLsZQ6+PpPyW0Vj3QKIDBj0OcU/zHXRGiGvPRbY5Yg2WwdOjHzmgMiEm3jXtCfx
 NLC1dvqnm9DFSQpekLEdmBTi3/6KYfTywKiJjutpSJqGYKgK6pHQDx+YQmJ6Umcgj+PC9dRp+Kz
 7q9tLAa6AdGY1VhXiJPFWQiyDrLTKOQP52qsOuknuIf9f1l1YYVdnm9fYmGJuO/IQ5JqzGyQV7W
 3OIFqQrvl2tL5GXTPNA==
X-Proofpoint-ORIG-GUID: dChsBqh0nUe56lxhXLkoKNrySSR1UFoj
X-Proofpoint-GUID: dChsBqh0nUe56lxhXLkoKNrySSR1UFoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-97487-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8805428355D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> The UBWC registers in the MDSS region are not dependent on the UBWC
> version (it is an invalid assumption we inherited from the vendor SDE
> driver). Instead they are dependent only on the MDSS core revision.
> 
> Rework UBWC programming to follow MDSS revision and to use required (aka
> encoder) UBWC version instead of the ubwc_dec_version.
> 
> Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

