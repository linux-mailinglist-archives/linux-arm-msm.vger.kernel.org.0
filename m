Return-Path: <linux-arm-msm+bounces-116875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WxA2KKS3S2qGZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:11:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 638A2711C6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:11:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Z4gbL/4C";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OaQFFjOt;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116875-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116875-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C428318C60B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B059D34041B;
	Mon,  6 Jul 2026 13:54:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0D731ED7D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:54:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346057; cv=none; b=EHXFnDVURvtgBRkXZjWPO11lD414cGhFKQNko4PIIJwFi+T6Y9ldRXb0PNtEjbYt8oiti8DRqxpPnsH/Oid/ZAc5frx0MvW6jrw1uD5VIAtgmlb27xcnJw54wVHkSEDxVqeIv27TMz6oZQ9fSarTYniKWN/a7f2RQ3j/TiEvs7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346057; c=relaxed/simple;
	bh=4vuXT5lffda0/gFdZLXd+9i8Po2lrGRYh6XChDNtOAs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HsNN1TORtehcJ+OYcIwBK+TF7dKCm0Km9i1AKl/0lW82zd5V5vDEfVB3lViM6SmKH/FIJCma2aet38lejyoLB+y4c/FDEVN2hUQEFhHTDYOMXAuUb+Q7jhz21ry2DecoDrvdN5wOGNRIaEF3Zrcf92Iqvr9cMl9760TXPEZFYM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4gbL/4C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaQFFjOt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxL3T369098
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=58PlpDKVcfs/bEqMroryqz
	3rBheXG3YSfA+tyMJBS3g=; b=Z4gbL/4C/Goikbfl0fUgluzojkni+17rX//Px7
	h/D0F89Nl2o4Dx2uycWT7FMyB7SrPr3NxnQFTFPplaJIIQYp+icD++MWbczGecFf
	2+JYRueMLdlsh4shJj09SW+p/KdMV+n6rrJlZzloQU0VBIgiKGLBpD6tHeY4OKam
	mgiaG6x3xwBaCXTxbrRjwxbphxfAE6zQnVeoPsHYL+Bt8sRe3slfYRy0nNX+tYyk
	kEmc6wEl5huM1lISdzd0t+i+L2oFHxAx7NzufmPZ0ChdF5KsfgrlH8NRgEOBaZhb
	BbSpbAeORdEgheRrZKgNcyX8bFEkZTRh8czGiAh7bE8bQzOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h99cxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:54:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92158791d14so311007985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346052; x=1783950852; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=58PlpDKVcfs/bEqMroryqz3rBheXG3YSfA+tyMJBS3g=;
        b=OaQFFjOtE730LIpwC9iGvPmt0dKdOdDH7aWTrhUwFL8xeRbKv9/d21ayVj2T7/+tNz
         8/ktP1AEAYaUSBTyW7nGd4eTjejPNp/n/avRTnQgE5Ifkh5K8YixarTJLF/34PHJA7xv
         UxV+8eTwPCtFcVhHZs48fMU5ZhYfJqPeu4TCqOR+F1wJPYplc/CebsMhe8ppNEhhM0jX
         eFZwd0MfMlpEV/lKF3qDLYEKX4EJOeB6TAa+5WP2GmUIQZxBCmgAKdOEWGh+X/mxNF+C
         caXVI+GX5GRB9FEevEnbSg56/tX2Lz3JSMcoKdAglCgUHMDXtPGu0AEFmXLhPedO7xbV
         Yrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346052; x=1783950852;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=58PlpDKVcfs/bEqMroryqz3rBheXG3YSfA+tyMJBS3g=;
        b=dfYvEaIie3YNk/c0kUoINHYiLGBG+4w+dazJk65TFJqFwk7LKcB8SyYMVUd8Hk8zDk
         FgZM5E09TSjljVSENkUakpCNRB2K1y1poPIDyedDmCkzBMYHQh0TbKWeZFFaB4/8LSPL
         jcePyg5PLOP1qVKgGCKtFm3Wu7+pZUyY1MxuInpkjpNFY8BU6g6Bo8tnUse5rLK/jfm3
         gB5xAxmn6LYTPg8iY8AtqgGVQIVcTtCtSw9W2TfTr4SS/DfBkvG0cRDYk/OMm6JZwI1C
         M1jS4opk2uogyBUrEGGYBqj+E8pqtAKrzuF1GF3hnwpLjHhs9Vo2GPC43sN36NksvrzP
         k4vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0LvUG+49E8UGOAuT5QZvEnVcVHA6yCZamaOZMGRpef579MMWKf1CLWiPcX2qsqFfNcsdJGW+QBVPaPyWY@vger.kernel.org
X-Gm-Message-State: AOJu0YxqgOz+52XPNY/qdpMUXH5z+cJ8WsK6xbZLNUU+ZsO9XNpt5H6o
	KbmeJLta0HsrYp+YZu5Cma8P9hHB/eCsFsxIrAY2fiMKk50JSpeC3M6nrvLpa/HrOC3MxPRu5Qo
	VHFEtEv3jH54m4EDPEvQKqdQfQ2PAnREbH0IsgxC38kazArYt646C6XElMdyrsHyRTgtR
X-Gm-Gg: AfdE7cn87fKUKN1RYI6Pw1fCpG2hRb2geI6Ddx7y/vt9kGeMbx4rvw5PnyOgYkZsYsR
	OM8SLGXWm/StpRd63oye1XHWVgXIihrqHVMKZUqlx/1z4WOxW+0rMCeLGNZZKni1LWyBiJH2EeS
	5CUaOyGvSn5t5ZHONCk8swt1cpj7I4Qanaz37Kwv8KSPfNVIwELI97kj7bdujOsG6S8FFeL2c8x
	cISwZl7XUOS1vckeODusF2ieDA+B6d0avHdVHmDgatDiubXMxBzLFEaVH6KvfiIHTURQm9fGf2q
	rVJFRz7AmNOjRuirSjDxyOuBP26CxiD09vkvcLi9wD2sjVw6Oi/bkhWLa6dzX4z+3tqNZxvSb6k
	Zulz/MHlqMT7bo/WGHQQdop6fr7dsLiuxWy9JUUQW
X-Received: by 2002:a05:620a:458d:b0:915:7732:ea7c with SMTP id af79cd13be357-92ebb5ded5bmr90430285a.43.1783346051854;
        Mon, 06 Jul 2026 06:54:11 -0700 (PDT)
X-Received: by 2002:a05:620a:458d:b0:915:7732:ea7c with SMTP id af79cd13be357-92ebb5ded5bmr90424385a.43.1783346051162;
        Mon, 06 Jul 2026 06:54:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm619805145e9.13.2026.07.06.06.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:54:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 0/7] crypto: qce - Fix crypto self-test failures
Date: Mon, 06 Jul 2026 15:53:51 +0200
Message-Id: <20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+zS2oC/3XPzQ6CMAwH8FcxOzvCygDx5HsYD3PrZAkfQpFoC
 O9uITHhgJcm/6b9NZ0EYR+QxPkwiR7HQKFtOKTHg7ClaR4og+MsIIYszlQsO4vSh7ckrLwckAa
 SugDvHaAv0lTw4rNHnljR641zGWho+896Y4Sl++PSPW4EGUtnC6W8MsZpuLREUfcylW3rOuIiF
 nVMtlK+KyUsobVw1w6d9e6PpDcSwK6kWdL+xI+aXGU225Hmef4CouCET08BAAA=
X-Change-ID: 20260610-qce-fix-self-tests-492ffd2ef955
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2647;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4vuXT5lffda0/gFdZLXd+9i8Po2lrGRYh6XChDNtOAs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS7N1KIUUz5Uc35MoBPxEssi6N13BpfBLswvXI
 p3Sgmup/rCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakuzdQAKCRAFnS7L/zaE
 ww8ID/9Anqpqs+izd6zYzpMoadGLrbjAD8ya63+OnNGofCXmQIdivR1GpcVtpIZ05LBXMwQN9vD
 9EUgZEZUptZz4fm2zXwfpD30KL+tDwOiQGE3Ksq8eLcqh90Sse2ONCFYZZk3OHE68VQBKuvN+1s
 COw9667M4ktcFK6r9j/EtjWqRw6EnG8HDfgbD2DG6pWd/zsuZrafE3faJ5g2HrloL5vWfr1Kfhb
 0b/IzAHMxFwseyFh3Zj427wR4pp7WTbclFqZ4nG+735wD/jjTJuSU73okml1TTmBBhCXug39H5s
 0/NF3Mxh7ypjUY3XtDwcLZtnGuYhCBVhw5+VuwdZLMqg4YtEG4Lz6ApjdXq639Y1eDmGnqCKP7j
 gp/iW8aTh1uVpPyUFGwqaqOhyCWizdcH3FrJW4v//lLAr31d+CpV5jOYvBLEyKRNH9w15Yz2FtP
 7mZBTo+a143+46uWa+13LqrCakkNl4sXJwYsVw45yGySGATtTXOv4HBl5oIy/ACBG2R4rLUds7q
 gsvc630XOTQSYmI8X8v6ESOu/2AhzDMBPYinIfN34t/sifapImqwKASMD4H8yld/9cO3v0k6aBO
 s+iUb2HDM3t532sIuTtnDq45UXwiVo3/Y79fsOOAwSKKCxgUQYDjm404sWkpOvI+5DlAAoCVlLs
 S3qoajKnKndi6dw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: TLIjbbKXy9t03J61J1iMaxLRIumnpQH0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX2W11pqbjY8uA
 pw3vg7HLGP0wNkY7I5frI5t9ty8eubkP3dstuGHlUxijXzW3rc9Gpd3XsUeAS1zHefXaqnnM+Ny
 Sx6ioWXvhLJ6HtRk8zjZyTazqbFlXBc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX6z5AP/XAjd3w
 3gbYLb4ugySmPc4h8zG0S+8SljhDi5T8C8mL2041FNMwDodHgbX9OJH2jHJqims/xeIstwpDJR7
 rJhk+MR8IEw4Q3N9oi0SVL0Q+Q6390lwEr3YVT4pg8gN5xNpw+hJAm4rgII3Lb+IogBEKF+iIVS
 DsbkUjfZl4PO+kwfWIeS1g2NvvQEPGV79zdpckTnzmkxfRkdRQM1QcZi1ZVG939ykSdFxbh4PIr
 77Y8VDtoaCC30Z5hN+MPqTKEFzwtydfzgzwWq38eaR8AjUewhw1L+mtIEfMky0u1pGK9Ml3SZd6
 tnfmvqi7iWV90MOwrs/q3H2fkynmY3HVMp1i/YNhv9/DtPh5O43UlHFqOmrZDMlDASUx2Gd8h1Y
 BN8vceQghVeCZOagBqGLdz5UV0I2yQfATDnH3EqDkxz/idj4K8lvyAzHXeMr1YwLI7AAsJuNtfN
 /vEJPDEd1kOycwopvCA==
X-Proofpoint-GUID: TLIjbbKXy9t03J61J1iMaxLRIumnpQH0
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bb384 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5rERACauPDyaBIpbJ_EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116875-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,msgid.link:url];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 638A2711C6F

This extends the initial submission from Kuldeep.

The QCE hardware crypto engine has several limitations that cause it to
produce incorrect results or stall on certain inputs. This series fixes
several bugs and adds workaround allowing the deiver to pass crypto
self-tests.

The failures addressed are:

- HMAC self-test failures for empty messages
- AES-XTS returning success on zero-length input (should be -EINVAL)
- AES-CTR: partial final block causes the engine to stall, output IV
  derivation was incorrect
- AES-XTS with key1 == key2 is not supported by the CE
- AES-CCM: partial final block and fragmented payload both stall the
  engine

All fixes were tested on an SM8650 QRD board with
CONFIG_CRYPTO_SELFTESTS=y and CONFIG_CRYPTO_SELFTESTS_FULL=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v5:
- Dropped patch 1/8 that's already queued
- Use the pre-allocated fallback ahash for HMAC transforms (Herbert)
- Link to v4: https://patch.msgid.link/20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com

Changes in v4:
- Remove remaining ECB and DES3 bits
- Pick up tags
- Link to v3: https://patch.msgid.link/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com

Changes in v3:
- Remove even more algorithms and dead code in patch 1/8
- Link to v2: https://patch.msgid.link/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com

Changes in v2:
- Add fixes for the full suite of crypto self-tests
- Add Fixes and Cc tags
- Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/

---
Bartosz Golaszewski (5):
      crypto: qce - Fix HMAC self-test failures for empty messages
      crypto: qce - Reject empty messages for AES-XTS
      crypto: qce - Use a fallback for AES-CTR with a partial final block
      crypto: qce - Use a fallback for CCM with a partial final block
      crypto: qce - Use fallback for CCM with a fragmented payload

Kuldeep Singh (2):
      crypto: qce - Fix CTR-AES for partial block requests
      crypto: qce - Fix xts-aes-qce for weak keys

 drivers/crypto/qce/aead.c     | 32 +++++++++++++++++++++++++++++-
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/sha.c      | 23 ++++++++++++++++++++++
 drivers/crypto/qce/skcipher.c | 46 ++++++++++++++++++++++++++++++++++---------
 4 files changed, 92 insertions(+), 10 deletions(-)
---
base-commit: 86855fca1d5d84fcfd6b93dfe8bff4eab6029ad3
change-id: 20260610-qce-fix-self-tests-492ffd2ef955

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


