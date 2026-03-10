Return-Path: <linux-arm-msm+bounces-96411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML5cAMNhr2kmWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:11:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5997F242EFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66E1B3064DBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375DB175A7C;
	Tue, 10 Mar 2026 00:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqxwLbmW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKX6fenh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28D813B7AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101495; cv=none; b=FHypZyO78NGkDnuR7e2Cb6TigYR6nzu7PX33BKGSoAvrnH49AgP/txH7EQ4g4xhU46XMBVmz5B1odJbpO8w31p81AfNiyOuD6u/e9oGentISQMPcicUrg71K1HEwCtbNranAqgTvYGP4S4zYAk4eKcKTiqLM4kPNL/SNu1PF8GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101495; c=relaxed/simple;
	bh=m9qCDpkjy5X2THY0acR9kltKP5HQGUMAZKo/7H5omio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bajdLIxkMuwWFNgMSvtheGe2JN3zD7bBPnpbuZl9HthH031p1DwxY6uoB9fNsNcZ+gA9eiLy53u0I+YhAN8yWHKok0K4k4HOrshZwFz8hrJ3j6ccSSCaC35AYh/8RKbFWoKPJmtMrpfPDSPe4KFZeA99xFjmNbuHOq+5NJjeya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqxwLbmW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKX6fenh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0h9744383
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pkr/1ETbWQejqwBM4qtLfTAa
	AxiiLLi9EmI3z7gEzag=; b=WqxwLbmWApf+MP0scmsGweu9kRuuQzlAxKa4xDS0
	me8bCEsYRkKs0UqWwp4R59vPcDuVB+sUvSjJYiktF0Pg+GoksF/Yb9wLMbKTsSy6
	eEvNwkXDKNb2s5O8Q9n7PJaB1PwXlA41ErXyFErlqYexgIloTKVfQBgaWmjJG5qY
	vZkjvoz4Gc9Hw2a0R2lMbYCxaWXF0jiwiNDghAdbIFS/l/57J33Cfq5PJC0QFLDz
	V83A0oMU9E0jnBSSPOM7pcI20Df55lyB4rTvvcc/Le0Q7hATER62nsGQGoDz1Ql6
	a6NqXFKxHRyQRVayozXJPrejWDjiCtYw3AzN/Slg69jV0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaawtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:11:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso1622194785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101492; x=1773706292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=;
        b=hKX6fenheOiLvBPZevhG9VID7p4DsmaLpZlIfdorXKat+r2czs4uFFCyDbc5iBcri7
         m2qmd7cnB/g5GytWPA0NCMLwUjgSEV1f7vvS6rT3YaCj8CvuxLVpODJCoH/D+BOXCqey
         1r7CxxPnek/GVzwh4PzROW9Sf3SwEmu+abu4OmbxAkDkU5FwLDd/HJ6s/t6cyKaF3uow
         d/4JvNLVBK9gJ1+eTS8PnDr8HuJYRBiUeKUAtNyBHKGFnzUJV4JW+6FuvpsAvO9YS3In
         +unmnhx8PkWH+xlxE8Lxfff06+qkbBB5iF1ApxoSFpg3nn2TlOovZbG07CyI8AwD1y9O
         hnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101492; x=1773706292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=;
        b=hYcROp1ZSqh09XkG79h366KNOO4aSnQhOBTIxm5f0Qh1mwz1VvAf4dwJ6ei2YUa3zX
         gFY6ZIe751So62Fy05cJ6HIb9qqznh9+GyklMD/0LNdzL7DSf+DXVb9zeOceB5BVpdQv
         s4PK0w2vVU5DgDqhfcfnrkq6AZU0xNB0eLU+H6Wzb5ECKVltaaKkFoDOpU9AsJboR1Dv
         omGAaI3IhKfNW9CviRpE9iFYiKTA7lfQbw9Gun/e+lxKsehqxatKIMhHUqROSg5r3L2v
         Ci90BeG9BxBp44eyDhMjUNgow11NwLnfqGAylnXJZG6KSE/Owp/HiXsZiihb0DUdGnVY
         ozJA==
X-Forwarded-Encrypted: i=1; AJvYcCV6IzE55LsJdG5TRbppIR4IkF+/J1OJO3nYufip/Yn6OwyQgr0S1RaoiRXWgodtCXA6v/YOLiG4jx+ZLutS@vger.kernel.org
X-Gm-Message-State: AOJu0YzwdIrE1bAl16nw20QEVbokum1JrtnSk6kmEJ2f1OQfDZ8lTAl5
	JsPszrQUCjwH1J/oNAZCzp4VSfz9ee6iEMv0mn6bbPpLif+StFBU+fqrFKY1Rcx06POspWBCM99
	EBQJgjn4qy8TNWeEe0n/JLLHvIRqqPqEpa6LO5k9mgfFjxT/2YkIkYzYpmPuWD/lVP0qo
X-Gm-Gg: ATEYQzy1s5qjtjp0uyYdlBgD8bHC6ib7BYRrbKizQviMSPyjcSSVYA3cTuVPzJhKKZP
	n+aif5YnW/ixhtmcObAXDRaKGIEidqUYl+6Pa5KPqRdbSAPGiCweyoy0kXxd215s2ONO9xQcZc1
	Cnyfvls3oEv+pNFZZNVKlMTlk+hUH+7YmxSZxjf23uveAAeQeaA71fFxGsxaOcrjno6WUVfrIpZ
	Ui2lgzN5gZajrsoTLi9RsXVIYHquiK7OZv7l8HyJFL9Vb+l2yjZfLgWn5Ik+/+oqBLje9fTGKes
	dNoUgxVgWIdaWYgsQDWmhgQfJyizsgkBx7Lxj3ISYDsHxouXY5VqJOt2VXOX8Atsb0JoOuzOUkZ
	Mymuzpsm9YjTv8F1S7hqQMPLGi2XQ2qTY5Qkfg4HIg2C4EWreLjfso/8iDzQerJ2Trd7yjyhaWM
	1x+fVvjveNL0z57tONPr47iOi1ebG8lE6co04=
X-Received: by 2002:a05:620a:4445:b0:8cd:8635:c031 with SMTP id af79cd13be357-8cd8635c4e0mr698515185a.20.1773101492234;
        Mon, 09 Mar 2026 17:11:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4445:b0:8cd:8635:c031 with SMTP id af79cd13be357-8cd8635c4e0mr698510485a.20.1773101491691;
        Mon, 09 Mar 2026 17:11:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfcb1d5sm1692581fa.16.2026.03.09.17.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:11:29 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:11:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 0/8] Group QMI service IDs into the QMI header
Message-ID: <ce5hwbo75dr4e7tt27bcprhpch6fx47omhn22ni6v3uzwfb2f2@fa2bebk7foct>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-GUID: 1n6hVSekVo2BTZpbmlSHuE9grG8BUKEo
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af61b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pNJNIoqo8oUBudG6fy8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX3OH8iV+UbO5S
 G10JQIfC8uKIawwMG0NQHJzQ1Vy7qlR+zMNnBEEl5uYc7I+E8igpdkC9SKAx9O9V19BRkx7tbUo
 fsOjSWckxtZaHG69VHTVOxJ6rA1ssjkdY5T+PTgr6CT/kv9EAAy9tE22yCNI67I+NNZPb5c9l8F
 mC5S9W0dVUMluGBAwG2tRRk3+IE1VAsPaoTHkYaOr1xHHZOVpaCpZtmc5zRNDvtfZdam9oJbSMg
 WMw7CMyctavAkXK4i38r/kkjHgOndoSWyWM+qFvaiSJd34RSeSctRC9ZilHHj1Me0B9bEKTi4AI
 jWl7UoAa2KMU75r8EjnZ1WtLlJOhUbVOoNqh6pCw8aNmnMWhSMCxMiO4e/RaXfIi3oLBMpIR+3l
 Buu9ZCjhYHphhqf4SwpajEeeM3DScYllzBvnVS6e3rjsNUG6czo1AQmlvTadyzSN8Z1+vW2Ehhi
 lzJl0JIg7CLCr83yHng==
X-Proofpoint-ORIG-GUID: 1n6hVSekVo2BTZpbmlSHuE9grG8BUKEo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-Rspamd-Queue-Id: 5997F242EFE
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
	TAGGED_FROM(0.00)[bounces-96411-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:03:29AM +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> It makes more sense to unify their names and move the definitions in
> the QMI header file providing a consistent way to represent the
> supported protocols. Consequently the different drivers will use them
> instead of their own definition of the service id.

Also this looks like a first step towards providing qrtr service debugfs
in the kernel.

> 

-- 
With best wishes
Dmitry

