Return-Path: <linux-arm-msm+bounces-93144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEDaEfNXlGkXDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:58:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B17714BAF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE7A630046B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CAF3370EE;
	Tue, 17 Feb 2026 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NeGuKjqt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HiS1ad+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC5C3358D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329515; cv=none; b=JZxW5XhZgkfRfwM1Be0xJUaQlVIZfhvV4zdoOhKuA993bNEJbv+KfEoXKbPuFvi3RrlPkv8T2Zt9MZf0TbYtb1neMRcUmbZ1rVA6u5G5CkR75UhlPPOpVLZDKAezVwBlGeyF7iikgPLBC6fQ7jlX+eeWwMNMtywdnFD62cds/co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329515; c=relaxed/simple;
	bh=lB/gf0E11bmnsgnV/m+vav+/LPpQMzKbtF3zuDEJCGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXmP9lKwbSNBgNmcsCYTcK4lD4DIw4w2synNp72Pvq0uAq4WLk5Uoh9pP8HJUvVO9B1WqaCu/UBcnC2qYN3O98OoaGZxi5k46eoXtPlKn75tLA5HcVS1lgYNU3IGbpxuKoISXs+2HjsilHvM3Ks6s9qAp07saDOlOuSQtfxcZFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NeGuKjqt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HiS1ad+8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8vAAv287925
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yys7gCD2fAIuUGWY1bRQew//
	1h753mI9bx5tH+LVY4M=; b=NeGuKjqtEPkNL3byMs4e5jpe3plPqYA1yvaH2mDA
	x3/euqTS1/kBqgqljLkeggZ4a9/ZgZVp9rTS1GILeWg5CM75j6aV4chhdSqwFC5W
	jiqUhoSzoOr6bpheZ7MqKQRrnF1gVmJpeElYKsR41LkRb+li04xZQ6Y0eb+P9gK2
	2/uN4KaprE2a0bhGFyL+y7zpP6Xq2jLF6PFwV8JOELIHIhBmtf/hYq9d3jplFjvd
	dEAaZsP/ExnEk2J1Pt+XdiH8l1qC4wEA7T+4HXSSqFDkeSZvYEM+mUuIDsk+2+Jl
	SGR5IKO4cxB9jdOx66HXwqjHjLjaPeyVQtptx9L+hStdEA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrt668-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:58:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89546cbb998so328819606d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329510; x=1771934310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yys7gCD2fAIuUGWY1bRQew//1h753mI9bx5tH+LVY4M=;
        b=HiS1ad+8P/3v4mMlvEtyAH+/PID/Ru6SvXcOW2FkZFSmCoLOL3NSHmwhfnX3RDScpU
         Vdt9CaGKRepBlRFJ8QuPlW/CKfD+ynIxd0YKWJjkbLUXFZ8Pu8Y4Cx+BaUaO6gu3+0tB
         ICVGkpePCnrs+Ssj0nuIxnroCk67R77xjntwQ1EAz5j+aqfbVRiZQjkL2ZlApW2fRZBV
         1Yv9oQL/EQBqUWJi2iR0NaOjKD1kgVRKjgAAxOMEACKhyqnzs3vKSitvfbkw+svPi+Es
         3Q5ppajt7iLBJdoWh1rIjSRfMa0wvcgIuE+La1t8lY3CFdR9us1UDQdy9gI8DqisaHHi
         wlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329510; x=1771934310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yys7gCD2fAIuUGWY1bRQew//1h753mI9bx5tH+LVY4M=;
        b=Xrokughlj/YzWwnNnuNrY7IgFIiNwEoFIHINe78TCTgeLeavbhS6jPZrPjKx6i9Pcj
         mzobYaTaA+dRRZ8b/7RZwwZnrhSbUZ2nZpiORF0CTYhWI3xs4+yKZ+2Q2rzlVneqRzAr
         GJ49q6LWniUOPHnZct66OjkB8/dCb1+QDIqH7gLgyJiguRt+LM5lsf3uUhgqedyffvIN
         qC2bl3J+fBIPjnksT0xGitbw2LbHDn2f0gEut+g5pbYeC4YIWR5YvaJGsugRNEaNgCnS
         DcoAEeROtgNqnuoot7dZEm1uIxyg3yrBr0nnn5V5Vwwm/imujXXr5pVsiC2Bwt5t/my6
         RqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEQht3o0maqpWG0g0375TFgV2YrApI6ghz8jnSGjvRKSawaD82dBAQIvL+gDSbhqcZ0L25gEujTGD43QTr@vger.kernel.org
X-Gm-Message-State: AOJu0YyBDBuNt73XzMayE+8XMrgJzpE0195Jq980Zf8qeQBf3nmm697s
	5qydWcuo4JGBL9OJlGKeh+Ij2oDhTCJXoSCC+R+js4I0UNxz76C9J9+FyyX+22D/zgwk0RaoxB5
	KanHeHrDBlvh1AkpFtuU8EWxI+MwSb0LxidcVLNMF7bBfHVkLhYdekFIBStYuTZNEoHfq19SFQc
	+Y
X-Gm-Gg: AZuq6aINtu54u+7p3b0wqD2YKelziBidTA4iFXOZ5SN9YuPGCiYeg43bvy2zUftLJwl
	eW7+PjtF7aqH+V7Dr0w2L18WqsRg3Fn5NhXY/hbChfbzchmrZM04k7AHe3lDXAN4IK5fmRdlhm8
	GsuPxTlHJG17IVMroTWSVEnkfFjuEkjZJocCfYayJ08oeBGl2Mhwb+6D3jrPMijz1oOCSKYdj7z
	0LkPD05zr3jfxUTFSt+1nCMHEagAzY5FnDxWGjKLy/AxihBziHQ20kA5tk/T6SuohjvzGId8Iuw
	O85b5xZFR6yAt3ZsRY+tJQFxzOL+bAYQH092YC8g0FcGEUgzNIda1I2tv+jiNsprDrIIr3UOA7s
	Wuxdd1qygVie/sYaiYskeYKahnvMLUPXURC9n
X-Received: by 2002:a05:620a:d96:b0:8b2:1f50:ca52 with SMTP id af79cd13be357-8cb408f0f2cmr1572582485a.59.1771329509847;
        Tue, 17 Feb 2026 03:58:29 -0800 (PST)
X-Received: by 2002:a05:620a:d96:b0:8b2:1f50:ca52 with SMTP id af79cd13be357-8cb408f0f2cmr1572580585a.59.1771329509248;
        Tue, 17 Feb 2026 03:58:29 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac82f7sm37773934f8f.28.2026.02.17.03.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:58:28 -0800 (PST)
Date: Tue, 17 Feb 2026 13:58:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH V1] arm64: dts: qcom: hamoa-iot-evk: Add SDC2 node for
 hamoa iot evk board
Message-ID: <qh35usnyr7utolqvtksmezckprwifswk2ktfmn4mbkjc27mn32@5hfm2faq6tkv>
References: <20260211093045.2595126-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211093045.2595126-1-sarthak.garg@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=699457e6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=bJ4rELEbWjrJv1d6mesA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfXxt8pacasTXFH
 53XxabtpcCGez8VFmLoBiFUQxlKTXJslGB/1IVE9svmbCS3SrHfcF7gjHME7tOtYEWIkXKYpUp5
 gi/hsnZW+NGA60sB9SC1qc2vA26YUHXCg7fFizVvAZRt5LM2y/VvyIgjzA08tjE2Z/ibCp9ayc9
 XIvJCWnBRG8Gm4/c5eZth8P7KhggHKlJPU5CUcu4qwqqWvqxnNSId1S67z7YePtk+34x9G52bKz
 3IHAZYyXeE210U64HNZt5aqTJsz5fPKIRAKwiaS/Br8yZbDYBPQvYvO0ZU90jrlcB9Xr/PaTKFD
 zfNoL9WT4MKIpSki14VkIAWwuJGoRb7PfE+4BdbKS/PS1VkfQZNjRKwkBNq7vQGYudYtCmvtGrm
 7af8Lh9G1tarM06GvZe9G+Iook9NV7Or4fKyFYKoktb6Vt27a5fUVywObU0+AfkT5R5hkGwn7nP
 2ZsF41Zc7MCKYRPU/5Q==
X-Proofpoint-ORIG-GUID: IKmlkdvgznttMfVeg4M_MThCOcB65Wci
X-Proofpoint-GUID: IKmlkdvgznttMfVeg4M_MThCOcB65Wci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93144-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B17714BAF3
X-Rspamd-Action: no action

On 26-02-11 15:00:45, Sarthak Garg wrote:
> Enable SD Card host controller for hamoa iot evk board.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

