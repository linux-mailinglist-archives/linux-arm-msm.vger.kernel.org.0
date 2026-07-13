Return-Path: <linux-arm-msm+bounces-118735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EwuKJNvBVGrhSAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:45:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA813749EEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:45:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HpV3OLRV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EKDq+Lmd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118735-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118735-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C07E5301F5B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CD23B14D2;
	Mon, 13 Jul 2026 10:45:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44AB42A96
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:45:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939543; cv=none; b=FjcW8NGDoWQ5vZd9Kn91SkOeb0nf/yyreaia1DUAICVn6tevj+Ijipu7i3aMGq5JQTd2/xgeoVSKbqoP6q4fkM82YKKOmh/pDUhaigCcyBmdCe0qYc99gXrtTDif9kklDS4dnxJk6CubR6WT+zqXBLf93tSeiL3yxpftnZ6Pdwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939543; c=relaxed/simple;
	bh=B6CAr3kqwiv7Vin0aJHCZqvOevu96eWIoRh+oQbeZks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcvW/myCzIcn8WNi14BRq6Ya1lOtjEn7UMdepyc5tpDN57goUU8xuo4tbRqC23i6pIbAu+hkZieYWX1yWQDh3fkhAmBSZ11+bMfG3FKyUb1Z9C55+IQSFJM2Yhs5pucBbobTQif/HguGOPiKYBn6Xxo6P7vX9G/SPuKpAO9Bbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpV3OLRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKDq+Lmd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nj31732111
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAo2B55+i0G+fZI2Hzc/8SyDCblIT6yT67FGpn4lZ+g=; b=HpV3OLRVikEMzm+L
	UK1KHoxsY71TapmYY18HEoY1RFvp5Z5t/knOcbgByrTEBTlTMbZwoAcv4ySlSbAp
	I2bmQKBLH9j47QKWtz3RQfmAUqeGZJI6VMvxN6LTOaraM6xe/Wk8qAHRBTrZDDr3
	yDJQr6byuNsHsdHnZCyQ93MiaxoTSMGvDYGfEv+9MF1MP64WtC2yld5Dw6qllOGV
	Z9TpBhOHbPpuVDzHhHVLs0EL6jfuo9Rune604NPGr4JuUtVgN/yc6JWQuKcu0sCj
	HLRskT6g5/bdGeET/o5TB3thmAmYUytN1f4p89p1+7OLUo2GoMhUxG5EZLpUGs4X
	AVIFAQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3a489-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:45:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-901fdbfc3abso18229296d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939540; x=1784544340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAo2B55+i0G+fZI2Hzc/8SyDCblIT6yT67FGpn4lZ+g=;
        b=EKDq+LmdhCGKCe0XmMD6dmDpGWtHQ2mNVi6F9CQ8XJaVl7XwGy2GN1zUvkl1GBTjTf
         PexBbekBfo/g994VKPbeO8VCEF6QdwB/J9bGHsMX54JY0nc7yz+Bwtnb1VJINRg19PE7
         claN2vGUmDa4i4qA8dlSucT4a9niRJPv62icJwjwKIG5ViGfZ5MateGNF067h5gwdAde
         HgsC/3cl7KX7LV31jY4+bFkuSGC06vuySsu5Qx+J7ur8DpzJFcSnomTSJ05s/MYChNGp
         lY1KHIehi1iF/HjqQgsvdXorp5LxdfLZOdc5dfPtxG2PaVw2WGqYSLW94WTbg02jvNxT
         m4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939540; x=1784544340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAo2B55+i0G+fZI2Hzc/8SyDCblIT6yT67FGpn4lZ+g=;
        b=LbN8eXs3il+LfRqNWuLyespfxuff9lQyu+P122rkoBV206d9SWqZnuhUQThmALe12j
         OUz7JJxUZ2vOp3C3sxXeOJWbSSK/S2KDs85QDMxv+oUUS7pS4kVA5kbbNvg8XZ/2cOvN
         QHAPX+M6M+lbgaXo1H9EaiGYhsYK698BbzMxMDDKy80UlWbbhScS/ny0+lr0EiaelB3Q
         3+md1kysdklMn161LUsbDSK6Swlg16z+Qk80Fwefw2xpwgJg3feiCH0T+Rov6R82N94+
         KCRj0XG8N1gOEnbyWVq5RCdmMDXEZlXvm4xqJcNU+DFHVupqugN2a9GThmMSU0JIXFMT
         R4BQ==
X-Gm-Message-State: AOJu0Ywl1D2ELDpIft2U5GGxWp/oe2bLlPvS1BFqqA8+wym8AaCb7LTu
	aQLG3dm//yZ11/JIb20706MC9+UMMmSUW0bjgooCSU5PChj+BKtTbXfOw+Z4+hMgajyQpjXPnjd
	5yNSZbCWOHE9brQcQl9VfL7Xy1WApStoEdTyWZAlo1cKRQNpjiGtyinFn4Y4rXSOZKLR4
X-Gm-Gg: AfdE7clJz93p/6uNKz0ThU92yY9X8h+GIkkPKltQmoturIeC7dXwi/iTyGhXiVciNwv
	TWd2HN7MJNKZQ1UUlq/msB2WULZGsfReyqXIElLYqcuMSa4D1nPEh3RHii5SISaJDGon1BZn+uW
	M1qK+yMOw+eaIKK6lZflu+z0/TOEMdw17my1FEa/P265CqxCa+NFHWuGJEQ+kNUYhsc1QMXc/N+
	FkhYUJ/jXfUWfnV9X+nsF+oCB6okhpN5xUrSvJRMM1xa4HBNqUSCk6bpwlxnHbQkZz+nz0LC01H
	eyg3B/vDeOT7NHpbmDpGhwkSgy05AJV2uD+nZUNYegpIk/8PhKBaKAoCHx029u7Iq9k95HejVZf
	AGNcIQlhEn1A+VpD1WwCZ7HjtaubZuWG2Ux0=
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr75217156d6.1.1783939540302;
        Mon, 13 Jul 2026 03:45:40 -0700 (PDT)
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr75216966d6.1.1783939539931;
        Mon, 13 Jul 2026 03:45:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm14502495a12.3.2026.07.13.03.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:45:38 -0700 (PDT)
Message-ID: <ee232d67-de45-4b99-9076-a04ed5842489@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:45:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
 <20260711-sm8450-qol-dts-v2-1-5eb2e86468c5@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dts-v2-1-5eb2e86468c5@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfX5cUZXDEpkEOy
 vDgOccchrcCDNwaOKPrXOrwrGi+vv0Q3QhDeN6BiFd3Vw2uobVrVO2Tgk/e1PkgBq8h/L/JvqWs
 exLeezE6bJyinfpmvKEEDRL/XkXd+tFJv90nSUXaTm9o5EaHnApYKqmDWwICb3RKYo9HkE5zLsq
 RYLoC0v9aWl6bU2Yg82ZXgCwXFVIzw7rxfq93J9YqA+toMlY4T+vnOGysFxtC4rpdv7QgQGvn1o
 wGsHrE+ekhuUa8w2eRtWiTPpwPKR6cP14ojAC7pwcUPs3O9GG0jDHwdcB6EqKbvJjhwhBqOlCZ7
 uGwUd0aPr/zKolNSDWgXQE8MwjObLr4KF4Xru8uGXHDDEv7H9ulTVm1S0ru8KXRRdaHd/SZCwkh
 m38z81jw4WLW9Qd2Px4jmMVpPH4cO+yiuNqa2dggjjePlkX195gLJErVzpvV5k5VTykhwlN9P5D
 FeKSwkrPlOA05ktG3Wg==
X-Proofpoint-ORIG-GUID: lz57_mgAKmwPxCnYJ_o6mVYMyoGzBm03
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfX+s64PaGVmi6R
 0d3eq1SXbBnisDq+S9SOwsG6sLbJWuyLzCifxv37+eoXBar3KpSeLB/u3ZLXYcSs1WulJ55RWZE
 MWGoHi3AIBVHf8P+Bx9anwfFUQfkr2o=
X-Proofpoint-GUID: lz57_mgAKmwPxCnYJ_o6mVYMyoGzBm03
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54c1d5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WSKRrXozI-YAt06nlCsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118735-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,proton.me:email];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA813749EEE

On 7/12/26 5:12 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> These nodes are not present on downstream device trees and only take memory
> away from the AP.
> No crashes occur without these nodes, so remove them.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

