Return-Path: <linux-arm-msm+bounces-116879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7Y0YKcW1S2r/YwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:03:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54328711B05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:03:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cxhnd4JI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ap8bImlL;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116879-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116879-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBAE331BFFAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C2E37649D;
	Mon,  6 Jul 2026 13:54:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E0D374E42
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:54:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346066; cv=none; b=IoC770tttyaGtv+3NEkm6wA6jJ/tBSkCHMHopnpPB57Xw/TYjRfFzee9Ktmh4/mpJbznBCbl+MV/154SrtQvbQXUGXgJB9fOKbwSRPY+4s6KsVUMsBFyb8QXGTIqNmZtnALQTXQEgbaBzV5Q1IeZA4cr4ij5gh2pSsToAsDVqC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346066; c=relaxed/simple;
	bh=CYY45MSM4ZMotmXQHnMyBcMwgxFxp0g8DkA1Qgi2eCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkyFdz8+nakqCr48yd+dPYxsPSjNxLuWEiXULd7ZkwMq8bm37VBitSoyyCNshZo3SWGiYWfQh9d19i5+bsgEC8HRcKdvzwxlBPr72C5Hj2ncfUGYOhcexl8HqlNu+FS5pL8brb8SzsXndd82d5APnoaLWZ4cPNsyQZPOVSNIO3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxhnd4JI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ap8bImlL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxP6H361559
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dh/jB5jnhJ+W/sIx1gynQvHO09FmmOdVkDRtzuKngL4=; b=cxhnd4JIPdsDB3HV
	RxCITPeoOyY/1Iz0V+VX/F6kgCLpz86EkkETIr5LtgNBMmi693/1Sk0TumfNzldG
	k6IZzq1RldbA3ohQ01yHN+pa7aMlzThe5Nr9x9T8f1YaGLlckun4UKy4WVsuImN7
	EZzUEhT66BQkk9jsqmagUzDsCMfgL1wNLYiddsOr5MSaYBPn3KP+emIMi7nJ+uIn
	KhUmZepuHUkRJB16xpzQVaoXZoUYDPyj4PyOqDEpUlidstkVy+4RUHMvRBnCKcJQ
	MykYCO+YkswnC7UDIWBm23IaE+1j4yy/lvka989mGH3zD6YiLYNFch8LTy9q0jGq
	zmEfNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h51c67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:54:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915d3261c5cso262611685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346059; x=1783950859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh/jB5jnhJ+W/sIx1gynQvHO09FmmOdVkDRtzuKngL4=;
        b=Ap8bImlLrF4s8edk+mQ2tblNhSbgGzBg7lNuA7360niTomlXYmH71AsXWGB3PxIi9b
         I8OkHoS+W2k2kw22Cd2cYI/YyRTVyfUULsLYsXaUz+pQzAJ9laCHQcDCxmMU9coY0X6x
         4nnkAuurNyDf/+zMrT6Rc4A+o1m9wCUgPSC5KYvhGXUCAcl65nYqq8r1TO3Sq6iLj5Jo
         MBjIO2M7YJLjDTqbhEw7hd/4r8POlAZZIpb08ZH393xW8LQoLbIrpwvLF0NnOdHuiMMC
         +Ee6j0/6eiaXlmjO+AOB6DlzOJZDSW8p6S7Ak/dzkill5+QopxE3WSiL59HP8lPNN8Ve
         OJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346059; x=1783950859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dh/jB5jnhJ+W/sIx1gynQvHO09FmmOdVkDRtzuKngL4=;
        b=HTPwSYuc7M+DbjTdzQfX4Dd8VbduRvbuXCqGGdoTY9uqq50X2wtJyuLBnSPI8zeGAd
         q4xqVIJzSr31ktWqUCVKCEBorLXuSMxrelp+hmdenkB+mo59+uZrll5NGPcy0phu+dTy
         Lx/eC1DgqCjyDiSgwJPtFTMWiO5ulRm4xg2/FF7KDIj+K/rn5fdY3LImNVhGP54OxG8r
         uR+ciA5UFaTdMikyBlmRrp/BWSpAjVMoQyxoHnp6tRmsUyO3d+KG19RPRBkZmVHoqHf9
         zYduqyjGixpx3njJ7xsak/tfcKiRZB774a62kfH4pktdpy0rlhyLnGAvOyqROdhoELKS
         7WpA==
X-Forwarded-Encrypted: i=1; AHgh+RrlpGAszl2sLgErl2uOr13j23BnV6HP8Tkf6d0Q/OG6HbQXzDQuPJ21NdYvRRomhcqJ3DJYsIvDPHQZu+Yj@vger.kernel.org
X-Gm-Message-State: AOJu0YxRDR5Hh12HTtm14UaCyFE/o5/K87nZQcMzqw0/1WzUNFnBxFjk
	yS5m9XTfgIA+lLDurjV2bzeisDMv5nwL9HffJK7wmp9qmID3U7U54qYFu5XHKv/zrByTX+Pwh8W
	f8XQ+KmcMkEAaVVv/ig9fibqzr4hB5H+PsfG1b4HlafI97F7S029ck+Ot2Lter5NXdXjS
X-Gm-Gg: AfdE7cnd9GXTZJ9Ny4beAmMH2c5F9/v8E5f5sJ2Z6ImjEeDKNXZMh0tiq3mglo25Tub
	Lnl37+53sJhyU6RvmKhwiBkzUWvO9PjdH71aGgZQ5qnmMUH0FOJIFEZKCYSSkWx2hO3U7ky5/eX
	4CO02e2uK7lTOxzhr1BlaBx0KLPy/yHvmml73JlOeq7gU56cCCa8KNd7iQq89ZyA9SbL3v0WKc+
	0JKNnMyH2h2Bwq6XlHybQtCKKcf487E3j9Ssz7AXKSC2b5p0U5MG3LS5xSWhcEK9SZWh+z6f3mL
	IjM4mMafwNPK6WnJY26LNrT81IbgpANpvFauyOA7C14bxYq1/ySWSMC+FCttSkDQi0MYKJbQrP4
	XAEtdV+hnFO3jAJN1TC3IrEFlANqzY33wCJ0mSFrJ
X-Received: by 2002:a05:620a:45aa:b0:92e:5d7b:fe5e with SMTP id af79cd13be357-92ebb4a77f7mr87673885a.7.1783346058520;
        Mon, 06 Jul 2026 06:54:18 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:92e:5d7b:fe5e with SMTP id af79cd13be357-92ebb4a77f7mr87670785a.7.1783346058076;
        Mon, 06 Jul 2026 06:54:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm619805145e9.13.2026.07.06.06.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:54:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:53:55 +0200
Subject: [PATCH v5 4/7] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qce-fix-self-tests-v5-4-86f461ff1829@oss.qualcomm.com>
References: <20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com>
In-Reply-To: <20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CYY45MSM4ZMotmXQHnMyBcMwgxFxp0g8DkA1Qgi2eCQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS7N9F2PQsqgPWerbzEG1Ny3CFRX3iVQwi2/tn
 3n/28mLl4KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakuzfQAKCRAFnS7L/zaE
 w+4AD/974L1WFHbttFV3QzVKJJkYq77j9ywQTrplx37/qk1W2sejrqyvKupD3FSRCbstJbObQVZ
 tCojY4/50jlhRz5O6AA05XjQHNhZytDp1Ag8q2bhIRGsaG7mXbl/y6EA741juZL081h9vMoijyE
 9JuLcetbEwoAQO5lEjb4xOIB51CbCT2pzXpXRxq8bm+92anwEvTju9QSvIXDGoL+5Dw0nd1u6n2
 /T50t30ufLoHZh/yQKngRpOmsGbWZK9BU3+BJrBBUdJ7sxtgwbUt4KssdTs8pSWYWhjmAjUV6Cy
 xl5U/n1YN8jNS+GJt3xNM5zlIWZCqyQ7V24GaHV9D7WVeRNSkm9H+3NIOJdBVAfoRdnpIt/RMfv
 HR4RP03hOFWXWDHbPuA81eKUPVDB3OLTFYx6yHrfCn+8smOVah1S8vfBU4FIC3x5b/GPlVP9Qf/
 PgxuntAuGaz8Xd4isrfAAuQ5+0UDRU5NYrs1cSkxQ1n807wKfCGZ8+n2KB8PhA3HoQ1BosBRTnV
 pUZTXXpHZ6CTFikbDAi1ExUS/RrtgFPRpQPhq0JHcrkP1yR860jVD2I8xOqXrZtfjSyFe9luRSF
 VK9UBuuHlKtn3U2pnttg0p1c4SXlBf5hY+Ogj2W4Jmw59gJhLDy5QVtVUE9PbLi50KVekmr/IN2
 eTKiP9QrdTRzhUA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 8H25wbLXR-dOUaaTPa9yXVZi_ThT2zRJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX03xAAo8zaRyH
 qHX134SXwdE+/s8mUI+DY+fi1CXwzfm4w3frScu2ODQ1qnlKR/4Ir3oUHQ/yzIw+RK9CEHJmXeI
 XSLWz+dPlw0P41BFLPVHZkNnv9KJGb8=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bb38b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX37asF4gEi4HU
 TUOk2KVHpoUTbjko0qhXVVkzQJ/yGAXAqQeO2xkx7hoT5pqKKe4IZDLXimqzXJ/kIJiU8rMoZ/E
 nKOrQ2aiwCZcjLXdVuWOD0bRnN0ZaDFAGx7CxZLmRJivWXjTbgFW/4vTFudLYsCl/5y5ZN/zcYU
 DMRu8U/b1jJ+S2eT8YVzh0yJZX60ZGNkfGS8x/JNqryqdc5FyGaULRznyRcD4IApcpQzhWzBPw8
 qR7wopJtO8YKRVOAjBDtg6XgBaPNWJsEbliS7GHEiLOau9NuLCvgVtmcd1DADufywgAAPpDJKky
 hcq36QQi+UP0Zph1J8RRGHWrFtBr5SQAsgNoLvTSMB1Xy6mSAD+uhwi2G3h/yFw10/2q65FRf3B
 Wy37tE3GBBIGCxGwMO2HOSPdmpe4wb9TMjT97iNcpObt4rAo7uHyzOkeQajw1oqgimSbl6NE03+
 LDusORgsZHTz/I8wfLw==
X-Proofpoint-ORIG-GUID: 8H25wbLXR-dOUaaTPa9yXVZi_ThT2zRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116879-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54328711B05

ctr(aes) is registered with a block size of 1, so the crypto API hands
the driver requests whose length is not a multiple of the AES block
size. The crypto engine, however, stalls waiting for a full block of
input in that case, leaving the operation incomplete and failing the
request (and the crypto self-tests) with a hardware operation error.

Route AES-CTR requests with a partial final block to the software
fallback, which already handles the other cases the engine cannot.

Cc: stable@vger.kernel.org
Fixes: bb5c863b3d3c ("crypto: qce - fix ctr-aes-qce block, chunk sizes")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 35ddbe03cfcd75db7599a5754e4ff978f3528105..54ff013e24317cd4d7a0dcde88cef8268db784c9 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -260,9 +260,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * AES-XTS request with len > QCE_SECTOR_SIZE and
 	 * is not a multiple of it.(Revisit this condition to check if it is
 	 * needed in all versions of CE)
+	 * AES-CTR with a partial final block (the CE stalls waiting for a full
+	 * block of input).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
+	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))))) {

-- 
2.47.3


