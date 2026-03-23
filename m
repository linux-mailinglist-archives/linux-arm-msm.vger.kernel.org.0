Return-Path: <linux-arm-msm+bounces-99412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCIVM8azwWnlUgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:42:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF1E2FDE24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0446F30451E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E313037FF68;
	Mon, 23 Mar 2026 21:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwxnAY3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMz8nQzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3980B30C60D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302055; cv=none; b=E6uFFAT/R2W2yeM8krz5l5e5iBIWVmK1BScOBkfZxFs5BJYcpil/M6bR7p2SFt5+1JATT/rrDwZzO57IJR/LmF91NNUSktsgVV4h7URpVwLn663Ek7wcAVEwsXJWBRRITVVTamk2HG3q2zQRdn8iKSWUbxmsGQNlTvtO0CPHMAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302055; c=relaxed/simple;
	bh=Od0Zv44/J30lc/0f/7MMe4+T6lsAyIz/ZdoZYWBUQvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpjuCARMZ/3WRkGWL+PsYtoqbR6nTn/QpALUdJ1JUXkB7xhZn+yIb08Zh9yE6StJl+ivwEonmkQ4RbbAXIkDZF3k8oAmk4WjnTCaPxVBwQZs7rpRNgBdlfR5dUgsicGRpyFt6dpCBjVxoCSpiwnKQQrofjawq/kkzeom5nv+VPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwxnAY3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMz8nQzf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqYXE2971815
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hzymoKs8HF1bDInfed/ZyQ9D
	caIeR6prW0f43Ezct5g=; b=PwxnAY3cymgv+tTRURZUJ/H1MHaH/TMqV5knEYNt
	agEyyjWmkJtEMjaTuFTP0hOsnFKRL9dUAK1/l7xH0NxoxtHnG2sJvI7NqmMdIbEt
	o/jy/a7P+WWXvIisYKR4YiJwLttOO9RUTFeQsitoLkOEi08y0b2toyNSkUp32/VR
	6caaRd7N1/pT+/6BasJAUu7D5SMFtc68I58lxezagDV6LLZ9NnScEY/5iaYhcGa1
	1FKIBqTb1Lj9XilAKi64G4hCKTKJFgCshBPAPAFo+7EZu391mUr+ArC27TzbFD/Y
	GKNWpqijTxO0QfApAV6CpB/oacR0sIwyNtkkZwMX/Ceqmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc2u4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:40:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso35547251cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774302052; x=1774906852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hzymoKs8HF1bDInfed/ZyQ9DcaIeR6prW0f43Ezct5g=;
        b=TMz8nQzfMC1OZ1AbdSHNhQBUvLKC1IQ9H4kdtcKtKr8DnuqDqtYUzHCZvT9fpGyE6t
         XUrvsibbZqYItvvoxx8d1GzAsL7osl5NG0COX74tfbr8Isq/RtTX0sxVIm5MHFvVyd3c
         BL8US99Nblea8klQEex/o7NXat4uJv4w588MA7IShpnbrD8RgzaWyb9yBATY8IzTOaZB
         ZENR+Yk7Lxhaoh+zlmHdKYD2wRQ1kbFzU3kAswsmNIdEL4CFqX1GsRyM7OIS/tPrw5+O
         /NBDvziriNRaP2epOzStyw6XYvnMzKyoQ5oCU48QkXLOVrOZnxGgXH6ZY4/SRz4qinO0
         fF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302052; x=1774906852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzymoKs8HF1bDInfed/ZyQ9DcaIeR6prW0f43Ezct5g=;
        b=BjihJ1WGYgmZ0fHuh1fXHXrmp6dHzBeQq8kE62iuQuqC1ucZ5qqPB+UxDtpWZvtvFt
         zktrN5rqqcfVWgYKDNRw8oU0Kjh9V2fMHKkXxIBe3wkVGfbyWPHYXggwaSUfjBkbLNxG
         uMuWC6bKhbs9/vFC/60wMeJEAYVoh/yVfdvKEKTZqMTPMgicNXTCrs6b8KFQDdjVtl4+
         DTpyYIt/zQahdFGUTev8ktSrnBD/LwD/lkNaQ+sifGiZcSrg9pIsa4GyE+XvvDCnmmBz
         5u0GYPUStgK90wuWZjcOX24Qys6Iw/JPVz5OsHiJCU4L1+f/O/eMZgAeHg48i7om7+Tp
         aI5A==
X-Forwarded-Encrypted: i=1; AJvYcCVenzV0lkwqC8ztxiLY+aYEFCOO8eykan3dMJHC4LdQXMGbMqqtkyl5Z8RvCfofnaFKQZNyMbAbmux4PtxI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/PXE+mnV5684n6cnL+7gmYWtHaj5TghYKVd8TOJYZa2iINDqO
	/oiJitzWQgEeARPqGXVYF3stHcZGK+FI+3z1jvdJX070LSbpgSK4Ff+e33X6jR69Se1ZMhtgWrj
	aq5bb9my7RqHCi4ULJGbcVN4NrZJJFV1a2JOLgCmOeitOXbiw+Pf/GNwNtNn+W1c3hjGk
X-Gm-Gg: ATEYQzxDvrdEjjlabNy46rxql/pOZeACt6cA2L9gBNkL1i886llLbEIE2l3o6B0ngxa
	uYQLPQWNcvkIC0ttdsBjQbJpd+lNLRAc+HHHf1r7wsEzfAZmy7ASHG3/2lFWuDYrZDmphP6YAH1
	Q+uQCsQWXvXKrkAssiBQ8i0T4dN7oEkd2VZkmnVYn670FP+X0TZKdVNVPwsB3rFxmCGK6uBVJQ+
	zMDUINpcjWSfOVs0jbu7uc/h4Y7Ve+m8AakXnpI4mQ/n7/JSrH9Eh8OvBGe6p8ICY01e0xavooU
	gRRAH0EGtOLPZrsEU0WICa2TUWL7pU/ALMy6RvlLRrMqM0BDPFkuaMAR3Evu/rJPFVtTXbOa4UO
	fW8VI+nu7Qtia4Mo49DMxiBZN3b1TXj4IXDm6jf8K7Bsxdg402yW6LHb9ZynlMSutULpZp+ghsA
	6xNppWi5dOcsA++FfbflQq00/Gg8Yer6IBamY=
X-Received: by 2002:a05:622a:354:b0:509:f36:496d with SMTP id d75a77b69052e-50b37504e41mr205140451cf.33.1774302052499;
        Mon, 23 Mar 2026 14:40:52 -0700 (PDT)
X-Received: by 2002:a05:622a:354:b0:509:f36:496d with SMTP id d75a77b69052e-50b37504e41mr205140191cf.33.1774302052092;
        Mon, 23 Mar 2026 14:40:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ae5c8sm2864903e87.37.2026.03.23.14.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:40:49 -0700 (PDT)
Date: Mon, 23 Mar 2026 23:40:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add missing msi-parent
 for UFS
Message-ID: <vr7lguh6367anqj6x4v6c4oqop2uuw4kcmssjhoe7t3qveej7r@5tp6xukfvovz>
References: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
 <20260323-eliza-base-dt-fixes-v2-3-59af0627b7c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-eliza-base-dt-fixes-v2-3-59af0627b7c2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1b365 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=P4vY5hjairbks-F6ILsA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: YAkJKKbwwQ8rk5N_H5gvKK50ns37zLAx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MSBTYWx0ZWRfX/kvIiD7aFyW8
 vsJonSQOzIY+Vhre18ZxeA6fgLRFxnOIldRp58kIhfapCCO4Ibrqv8hXyroge85p+zCIRu1GIIv
 fzMBkGeWVh7MSqB19NERg7dZFwWc3VtOjyidLn6F1j3NCcbdmZDDzECU+u2ihl5FgkVRGBHmte9
 M2ofFNI9fs6DpgUxUH4HZK0FeJH7WbhOMDXDcZ29DkYNgtNQnKcrHYX6jGn40HCrYKsmXWUJR+E
 BHR/v/yqkmaMklJFGZMxWQr7W8F9R1bYvaVSpjTQrme9Nd+z5d5UMqDiwxsmSKGKgKtwuTXY9Gp
 7cRJ5+QD1vfZYB6cuVbplQAd+9qYKFfRZrxcWnwddUc/zHoGTcq6ZKT1RboBEsFS1MX/He/0sL/
 U3JXxqM6HMBGnFJXz9FNBCd8AnGf13OFPvMaUWExlzAXBdrlMdgdO/GWoWoGDhweHHOAfMoBRji
 mnsvKc1FT5R4A3h0W8Q==
X-Proofpoint-ORIG-GUID: YAkJKKbwwQ8rk5N_H5gvKK50ns37zLAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230161
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
	TAGGED_FROM(0.00)[bounces-99412-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5AF1E2FDE24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:23:26PM +0200, Abel Vesa wrote:
> Wire up the UFS controller to the GIC ITS by specifying the
> msi-parent property. The UFS host uses MSI and requires a valid
> ITS mapping in order to allocate and receive interrupts.
> 
> Add the ITS reference along with the device ID to match the SMMU
> stream ID.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

