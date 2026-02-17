Return-Path: <linux-arm-msm+bounces-93047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GQGQMxQMlGnT/QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:35:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C9148FA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B07E301588C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 06:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1434F283159;
	Tue, 17 Feb 2026 06:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7tzI6Zs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2KvgxRA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D00262FF8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 06:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310097; cv=none; b=PBrUNgNBXOuUF+qUL7wziulVs/8qZgJcuzudhKdl/JSkh/I7h6kfGEbtDoq9CQ8npLN0eFoG3Lx+igQU4ZmBymePyrofx/9NJDmE9BQwMyLcp6mh9Mzuc2FLZr8JkGrlt+8oQw1JD+CS0EhuyOsivFKWKdgMqqmumIbPDQns6AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310097; c=relaxed/simple;
	bh=JhPv1xXhO2rKgUpDxUD04mkBJ5HizP0NjDWHT9ofgRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UT2q3dhFZrbLpMMZwdmYqsaHAk999w+OwISh2U+5PqFOlbD5XnIR9YwpBnNa4BBkkvYZrTQDUSPLwJBI+BUbNNJx3gHBhP5g7qznD0YOIPp0rqIvbI9MsY+tLZY9qL5MhcxGl0gNTKsh+zLI+jPD03BrV9VemXoJMlXZ1rNsAyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7tzI6Zs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2KvgxRA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GFtMJL297047
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 06:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2XhnYVSOv0Bi71r+ikrHXy3C
	HaRUjxy1U7/+XGjaO6A=; b=c7tzI6Zsy21+B8kxhz5BjnfNufjBPo1oWJP0XwGi
	RN1bBbpC5Vnwdk0KpIMeV9uTGnxaVfXcbOWuiZ/BAhGlf8shSpqT5pNdI3DKW9xW
	hIeK/nqXSTYE0jl6+q3IGDAMhSODrPVJid00JImyHKjU0j5FNRJxo2lQDD6J1jbC
	/3HGNeUJwxBZ2HRfKd29Uu6LltSSwZmCoYVWaU62UHJ3QpqFAFaKrEq2UmLV3LU0
	cJdYwePKisNDHkKuphTmDjCiqkAEymNoV+Fr+WJaSBx1C2KHus+su7TCNfCrLoTm
	hjLM792JufYPMyZp9WgrhBF1rbLeTJMYw3qWBwfy8I1Hxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9sdv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 06:34:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so1887701385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 22:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771310094; x=1771914894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2XhnYVSOv0Bi71r+ikrHXy3CHaRUjxy1U7/+XGjaO6A=;
        b=I2KvgxRAt4eQ2xbN8vt0Dra6QobQ8i6E1C6SgMRmFtJFOBURZk3aSMkYu5V1kyOztH
         l9HcNStx6/bChMHGcNPwBNReL1RCihxiLalX5fzEFr1fvR+8XLeZBalBDmf8HPg3Hl7v
         e+oqRf+QhiKQfyg0x0JVNQeqkDQNft62zW8mJUm5trm33XV99gqsL0AllnGc3pUEz+K5
         4Ht7yYqEzDzMdmJtrZNOw81CUBqFuHRQKiNc4MY2dgvCiky/pN2iD6QX7p5I+D4+KRyv
         CQzQHUc1YUnHZlSmBd+qr6H9z3mh6bozDSWZXvibZbUmNQLRuMX0b1Ie+pUKYSUWpLd1
         iLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771310094; x=1771914894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XhnYVSOv0Bi71r+ikrHXy3CHaRUjxy1U7/+XGjaO6A=;
        b=DrcyolH3vaInWTCFG3LkurAfz1qLSBT1JmM/sO07GDPtUv5fSSfTIn3aW+IIztwaRA
         QUmiatak4W/fVm+VhddkASaDV+VV7UoTMx842Bn/pHKC40B8E5b1DFa2I5BtdU0A9Bf0
         RftJegHAp+lI49iFKNo8nMhsZTyBJ2EecjxVstLJ4Nw5x+od+bv2ZG6C3TbkIzj56zHz
         97fbZ24u+aXNfA8DhhvLkKSBaZRiamqZrDHzMu+88s8xn+bXwOjdJtAs1b7S+WXkWNg8
         7YAdwgbNqGO0tUObBb3uvtKSp+s1HsySvO1rhnud9uhWhVQOrPT9ODFaOyNWUpHoF+xI
         Kvmg==
X-Forwarded-Encrypted: i=1; AJvYcCWA1OPcXZkzZcT9uXYLO1F8TJYsgDY1qyt8wRa3F8hcWb3QMgprF0jF+l7BOi0y5WF3ScfOQ1yZquhmKXDi@vger.kernel.org
X-Gm-Message-State: AOJu0YzDkhRT6kikP83w2YKzaALxJcdWaj0EsNHdOaFOGo9lQQWAsLmL
	bsZO3y+2pdA/N0Oa+h/BxvGprJ7S5Onwi/wyPFp+n2Uj9CvRLdJQzQO+45mwrzM4H2IQtUGzf0R
	btXKKjSYZhTGLifacSYLYKToUXW7fp9QIR4/qbqrAP5NfAFGIb6Exz4ltkEBRRFVz4e3x
X-Gm-Gg: AZuq6aI97QhgpfFTshqrE1wzdGwwy/fUkaOM0Hz9cajZNHkBdfERk2sZgGmvnelFIOm
	Wb1T8LN86jeS1eg0I7LFuCf5G47Nws2Yrv2AIHHkNASR4uCNy2ukPLQa2hY1SEj11BGIbOSxCVf
	A/Qh1WTFvsh57ZMEUl/d1F31M3Lpr7KkhkE+u0I19UWUF8FqnWfqoC7mtQIZs0bf5kRWlZuM8qC
	GuNPvT8ElKKuicoz7eyzLd2K47dbGP5Fnkr6OHvW/nYs4ctdYN3qYUFMzZ8jRSnce5lAuFBOqZj
	onu4gwex22uFi79SJhrab2SGFAPtwCKTvjW0BayKmDkCXPcnkPZb7xdYqgIQOwMHwZeQX+nmqgH
	GzNlOuSg0QKhxEm9kgAedrTlLRcnoq2iwDNCL/2+Dgy0wUy3KeinnYZdquYA1C9yzsHhx811gge
	MSDohVm1I/tSafoUUZMyE5NeTHjmpbw3mWgZ0=
X-Received: by 2002:a05:620a:46a1:b0:8c6:a034:9225 with SMTP id af79cd13be357-8cb422bfef5mr1496100585a.35.1771310094246;
        Mon, 16 Feb 2026 22:34:54 -0800 (PST)
X-Received: by 2002:a05:620a:46a1:b0:8c6:a034:9225 with SMTP id af79cd13be357-8cb422bfef5mr1496097785a.35.1771310093687;
        Mon, 16 Feb 2026 22:34:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56312csm3792271e87.6.2026.02.16.22.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:34:53 -0800 (PST)
Date: Tue, 17 Feb 2026 08:34:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, janaki.thota@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: bluetooth: qcom,qcc2072-bt: Split to
 separate schema
Message-ID: <xai73ei5ixb3qpp53cjvk2h4adlfo2zl7qglshup4pbeyh4fpi@ihdos4z6vsoo>
References: <20260217054731.3058567-1-vivek.sahu@oss.qualcomm.com>
 <20260217054731.3058567-2-vivek.sahu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217054731.3058567-2-vivek.sahu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA1MiBTYWx0ZWRfXziCI04rTbZ3h
 e9CacujP47q0sl17Dik3lXVs8m/U2vd/0mQxgOMq+apenDBuA0azY6xHQpDRRi700snxSNzXPqc
 CHViJ5GhM8MzQLhDBCTzSFrsjfdfe8UVHi20yqa3eEybqeeFV4mB8CvqbmZ/+1rJsl7C+zhcv56
 FSf7UMFNqwe+n0WSYC4Bbvj/ftcas+9XacS9jLn3K2x9NzEt3W+X3M5N8IwbO9n5iASg7hxh1eq
 YeHdBT779He8/e9qTreVLb/LcXJROxgtQ9+aOHffFBqMumsZDhfq1IFhCv0FpLdSHocPhFtJVRD
 m30XaCUudhEA29UJPoE8FtSVUWKcD22aBDBwaZ5MSF/jMkGVff/q38n6lFhJmk9hteRaARLoGau
 5iY2Sm+BBOqTl3uP6DObhNBrzmdwXaWZSi/Y8Axa9zUlKQG+f63oLr0STXa+ZAzMf/9vyKgkmBf
 Ql0xmy06Ev5kGAo4/ng==
X-Proofpoint-GUID: X5UvCRq0aQXEOn2BL7GHw77AnScpeL15
X-Proofpoint-ORIG-GUID: X5UvCRq0aQXEOn2BL7GHw77AnScpeL15
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69940c0e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=uJRx3kuxFX2Ebkl9aE8A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170052
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93047-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 260C9148FA5
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:17:30AM +0530, Vivek Sahu wrote:
> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
> possible properties (19 supplies).  Split qcom,qcc2072-bt to separate
> bindings, so device schema will be easier to read/maintain and list only
> relevant properties.

How is it relevant to the commit? You are not splitting anything. You
are adding bindings for the new hardware.

> 
> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
> ---
>  .../net/bluetooth/qcom,qcc2072-bt.yaml        | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
> 

-- 
With best wishes
Dmitry

