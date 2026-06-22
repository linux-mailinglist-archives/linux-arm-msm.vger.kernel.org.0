Return-Path: <linux-arm-msm+bounces-114001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DdaxJ1A3OWrZogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:23:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFEE6AFCCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:23:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Db+8sPSk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K0oucX7t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114001-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114001-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C03613074041
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C024B3B71C3;
	Mon, 22 Jun 2026 13:18:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1E33B636A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134328; cv=none; b=a3ShstyAs0CpQR1QXNbydjVS76lXLAjmOEsgUbRjFgGrq0DzKWBT9mu4e/GA3Isk/2luBketi/HPU52+rXafJM4TuLh8I5nj3c2EOrGTvwInndqVOpdUhsN8hYeqOmrHT6H65ElhIUMKl2Qf3Xno4l032gKEs6s4lts19rRZ3gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134328; c=relaxed/simple;
	bh=Ejq3GCF3ALDtojefcexMkYFTMI2wVEXKIrBlhj81Swc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BWQEGChqLs4pYWa56MUoOzBJUF8bAVhyf78/gyP8ydTY+WVqfV1kRD4Ed27IWWhyXvxFfbOOv8GwCAe9nSWUcjxnQlr4C0bwtuqWpidWukSjlWccmvgnq8jsk1aFXKyLEGpUnwKSEHjkPuHUkUwSylU9L+/v6m6hLvjwZA0Jw80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Db+8sPSk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0oucX7t; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGQPY1364364
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EagaE396zMSCowVPFT/Lv2P0BLvUgaUxoxYWM76TMv4=; b=Db+8sPSkIIyDME5t
	prFz529aRKIixWWmfWO4AUCTvL4DGzP7pNHyy6hI66MF+3qxNaNJGdbmj73t1DLB
	Wzv/KLar0GdtgOaw1Yg45kNX5HX8K91zbKbpRaXHbJHzBDAiwpGEZtHYitDUkUuM
	hsmJiGQk/RbGwgcFh9UMnVBK6Ub2HypnxWOWoo0QGN6hD1FHKzuJ/jvcLyPT7wyN
	wgn6UPxt/kUufKkGsBSzaicgN9l2JOyOQT1ZoEzjKOOT/4x3xIzsmkY43ss/ro2X
	9bUNpiAVxNAnT60Kmho0jAILi8L1zoyZU/8s20eQAuRn1R79PKZ447H1UNPNqUJZ
	Me8Fww==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5prar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:46 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963b099b539so7031372241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134325; x=1782739125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EagaE396zMSCowVPFT/Lv2P0BLvUgaUxoxYWM76TMv4=;
        b=K0oucX7t3V4q4rJY5bHcCfs8LfSHRBHRbPdz4U2limMAkSlrTmHcGbJsmR1MtxGcOp
         Qn27mgwglfZgBftB5qqxWOX5Z0+JF7lIL7yOXDYZ93HfjF3N//g26U3MBwjhGqrbr2BX
         pq6eeR8DVHrBBr3R8bfAbf28uyb4JTUfuSoIQw+NQkwmYw5X7mET66THg6NcZjbGycfI
         MohsWxDrFVnklOGbo70k5D7sgkJvvSm/wnkfx/1M2OIV333PvE0YvBWzLEXx1kiAmvCY
         Hffmwyb/GAVLGvwXAfp9zLFUp4nrPdaunZz8Qx7sERwH2tCer/ThSFL2dAMYiS3mzLzo
         RQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134325; x=1782739125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EagaE396zMSCowVPFT/Lv2P0BLvUgaUxoxYWM76TMv4=;
        b=NqjY4f4km4pMU+9H9Nv6LYqwUDuZQugQ86G9fSmwRZU8rNUiWaluQiuDmHChVgQ/ok
         Mm/0DqaGM7qTjItiTlCeS9fBvV7qnhnvIQl8cGxptjZEUqwsL3O6L7xVcvhsNGaKwpC7
         IOf9cnLl0erDwIwPG8ESvtLDfqz+PVREZi2YzGvig9GZIctJ24rS+4UDTRjknzRnJi3z
         XpesBf+u9AKAfnf8hDAPHb2rzMtJNHofyACqQa4/s/rpv0Xx3CShmNrauYebi87bF4fs
         0ImS77FCZmga6f/xxyyDwz66kjM3Yc2k9QCfgB1Xdn0fZn37nUu7QxLIVOBtKbz8xytY
         /OFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DwMZkJhZFtkBghB3Ple3afbmhAPVJ6+MkVbhS/gCnL2Q31TyvKAtLvSnBjPYW0jlBWA4MeW1mdUQ7OHS+@vger.kernel.org
X-Gm-Message-State: AOJu0YwiabnagsBaV+DrUbMJacaDRnK/OnU2PZkRyf90PFCYiQMe31zP
	RS6Zc4DYzJSlL3bjDJmA4xjwFCO4750gAjcLNhwZ1ZOHhet++pL5YUE6oxCCcte+6y5QKPyxv77
	GyBu1ul38amtLT4TUfw/E98JoJqocO1QJ5LonxwYRwz5nYUC1BO/vz5xvotjwKemO/Zkf
X-Gm-Gg: AfdE7cnJ34QqJl+uA36rMBzbVdKr98ZpnrcCaCdrKdA95T+zUr88PhoKOy7EdVS7niD
	FlxV3LEBZi5GAA236Xy21n9p7ajkAFc00HkYSwTex5O/liLtrFPgbUhFFSljQQ0S78Qgyy4AX1k
	yimg8VSV9DYTTCdWUb7GtY7CVuEJge9+L24YQi/66ZpD4pZKLOQGhSEn1l7dmLo6wGS7L+ZlhIo
	1Pcq0RVLM5uTfU3rctvB/h0aO7HAwBzSVb3tuScqnM/P+xnzrZWRpGG4nQSb4l4l97j+F73NXN4
	lQlP5Q/joX/0s9NfhT7F0H3zQoxWuRLAqm0mMUvcmGpUi+yui+mPTMAOezcHPNF1fesKGOdUoQB
	sjCUg2xlyl6LTAuzASjBttmnwbkmyzeYKFSyXzxNH
X-Received: by 2002:a05:6102:a14c:b0:726:c671:9b3 with SMTP id ada2fe7eead31-72a28dc5b45mr3659844137.11.1782134325467;
        Mon, 22 Jun 2026 06:18:45 -0700 (PDT)
X-Received: by 2002:a05:6102:a14c:b0:726:c671:9b3 with SMTP id ada2fe7eead31-72a28dc5b45mr3659822137.11.1782134325066;
        Mon, 22 Jun 2026 06:18:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm294083835e9.7.2026.06.22.06.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:18:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:18:15 +0200
Subject: [PATCH v4 7/8] crypto: qce - Use a fallback for CCM with a partial
 final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-qce-fix-self-tests-v4-7-4f82ffa716c6@oss.qualcomm.com>
References: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
In-Reply-To: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ejq3GCF3ALDtojefcexMkYFTMI2wVEXKIrBlhj81Swc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOTYi8Jh1v8wUta/O9lvYexzHQYDAyJQDBui9j
 VQ63gP2oAmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk2IgAKCRAFnS7L/zaE
 w1fPEACf0FREd4HRMwqXi9jrqFiMY2ieOc/pFZtlCrygde9QxQOlRqkQ1OfS3/Hv2y3YuZT2tIL
 UbnRMdaddzghJ+gis00EKzz3wSo7rGue5kGLiELEyZMDgXlsfeKaEC6iH7IaKaaVjuNTdhDtMS7
 OSZrUhsojr8g9gpKMQMGvPpG5p/LV/JAQXhPmS+TppIvPzlvKa1kMW+Rhj1tr5hOCwWy20xUTYZ
 cNBaks5Glryvhf9IQ6QxmnZW6LuKmF0RyK2BGejJTcVn4v6fn5c38PnfmHn9KSdueE+g6F5AOXt
 3mMgy/M6+l1DbfbNWAJImg4rUFfOtCYBIKVwvRp85Za5tqTaks8MsjCdtUTdKfdjKbVuXw9aGPk
 iaO4ciSHJ/xkZqknhlTPv7cFh583ySpDdDx3pZFMzNi3IJP6Fyh1cRg/bQG/YtgP5OBh5Pe5ZRE
 nuPsH++F5q8TmOlqjuE2QXkO2RzLFmJb59QuhovDJpgkwTWM3EBNYIkRP+pZaOpwYhIxIPM69BZ
 lcPZhqoK9Qq1sSJVRGc3ZymBXC5yWDhcxBcqeYMmzE94ZSK8g9oQ2Og8ym+wAOg827AqdpiYetH
 0Ko6AoViscjj33ww9ebnWgT2TpqQAy+e986HU3t+o+sNAbTA75uQz0OnWHUMZSUxazmLlF2x9eO
 8C4Cf4Ts4vtCVjQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfXyo1ObDI9jHMx
 noQfbXbJ0T85o0B+aW6d4Z+DJ4AeIL1dwpK0r4MkpXY/6ubPiJJIBG1RYOSigqpAAKtf5k0SgUp
 ooHq0jQziMjJGujFutqIHMdMDML8Z4VAgBGGo0otJLqn8nsq23GEKXhHvIiz0iuG076g5PT2f2w
 srX9JacwrxHQPykeWq6imZh0oxqp7iVyeRx0Ukr7ih8N5exFt5/66o9i4L1nTUfUKjrqOrRnHN/
 CwL40Fthg03RaDeR4wBQub2RcFDSFzAv9RaZsuax4ll1b9CmpjBJXbBTRJ5GZBPCeMLGkPZH/Q5
 7rKAaY2wG3dM8LH+Mc/JgG8lJlMprqYTKniIthg8IY91VKgmGYuWcqjgXwJ4JYcfOOit7AXVVcx
 CwSJGmO4d79IBx7oMYh4RGkJEls9lvvmrLFP/7yW2IrAtOFeBFBCWTzAXGxlKwPSPNC596ZbkBM
 OOWekfJjFK0csIXHN9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX1VlFf+sKJLZ7
 24C3U9ieJnZt8d0O74OfjG2Mrpwbf00s34cvpmb+oQOt9i+Iil4jHxrOSy8MdMxxr2aHPR1ZpKx
 82dVF0JmS2dMVnqZqBw/n2+aetVmD1I=
X-Proofpoint-ORIG-GUID: B_Kk4ZxX_LZGMDNTY-K8SGFirb-du08T
X-Proofpoint-GUID: B_Kk4ZxX_LZGMDNTY-K8SGFirb-du08T
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a393636 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114001-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AFEE6AFCCE

CCM builds on AES-CTR for encryption, and the crypto engine stalls on a
partial final block just as it does for plain ctr(aes): a payload whose
length is not a multiple of the AES block size leaves the operation
incomplete and fails with a hardware operation error. This was caught by
the ccm(aes) crypto self-tests.

Force the software fallback for CCM requests whose message length is not
block aligned, reusing the driver's existing need_fallback mechanism.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 336614a11377e0be246817da584296124f4de5d8..4fa018204cb628c112f64c45ff6c7407df73b945 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -514,6 +514,14 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 			ctx->need_fallback = true;
 	}
 
+	/*
+	 * CCM uses AES-CTR internally and the CE stalls on a partial final
+	 * block, so a payload that is not a multiple of the block size has to
+	 * be handled by the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		ctx->need_fallback = true;
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3


