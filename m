Return-Path: <linux-arm-msm+bounces-35062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9379A4A77
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 02:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49CE0B21AE7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 00:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C73429CEC;
	Sat, 19 Oct 2024 00:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="MV1ZB5l/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com [52.119.213.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F237BEED6;
	Sat, 19 Oct 2024 00:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729297366; cv=none; b=F1i/HTG93QXAs0+VhS8mhZItTjj+zFYLZKyqsRBwU9SGoxJ46nVoVePFZYFlyXHG6njauoxY9mcLYFW4nED1i6TuAz5SxHlMM/LHlNnWqXaibzRhw8QzM+4vjY68ICEzivh6rc91287dKXC9kbnHVPGcd2wh6usue3H4KKx3wOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729297366; c=relaxed/simple;
	bh=OjwqcLjusCuMEujKAIY1zbhzHKZz5/39jsD/YDCvrOw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kk6E3GAo8syZJjuwcr0FCWmbIyFNE7h6LPu200ev6c6cQDegwG5rXTehn0QcbUv63YZUFqNYKUJkJhSoFq9kNbgnKjbfv+O/dDnLG0RgTtATzXr+EjTIlp4h/aZtSfi1duOnvDdBNtzJeHIXw8KhnufW+PpcrZnbIZsO1jnyv1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=MV1ZB5l/; arc=none smtp.client-ip=52.119.213.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1729297364; x=1760833364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YkFWxEAH8ig0VPlLUWEewmJ7RrvUMzN5ZoJU/RdWdBU=;
  b=MV1ZB5l/pcvNHUsSj2IPRHhN9t1rIocw0FxbzBPE9SDPHbtrzsXe4INY
   0MNwq+tsAHFz1E+2Bfe8Rdh313Cm7bay4Nxw3fntasmlnBegLEhTfHR2k
   A4YMTsTRviW2V6N+Hg9EAjXxBYlqi6/J5mBq4NFDM6qghV3LkJrIh/dIi
   E=;
X-IronPort-AV: E=Sophos;i="6.11,214,1725321600"; 
   d="scan'208";a="240571657"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 00:22:40 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.21.151:49767]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.59.23:2525] with esmtp (Farcaster)
 id 8dcfac51-37b9-4a09-8c82-c69ae0a4798c; Sat, 19 Oct 2024 00:22:39 +0000 (UTC)
X-Farcaster-Flow-ID: 8dcfac51-37b9-4a09-8c82-c69ae0a4798c
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Sat, 19 Oct 2024 00:22:39 +0000
Received: from 6c7e67c6786f.amazon.com (10.187.170.44) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Sat, 19 Oct 2024 00:22:35 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <denkenz@gmail.com>
CC: <agross@kernel.org>, <almasrymina@google.com>, <asml.silence@gmail.com>,
	<axboe@kernel.dk>, <davem@davemloft.net>, <edumazet@google.com>,
	<krisman@suse.de>, <kuba@kernel.org>, <kuniyu@amazon.com>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<manivannan.sadhasivam@linaro.org>, <marcel@holtmann.org>,
	<netdev@vger.kernel.org>, <pabeni@redhat.com>
Subject: Re: [RFC PATCH v1 04/10] net: qrtr: Report sender endpoint in aux data
Date: Fri, 18 Oct 2024 17:22:32 -0700
Message-ID: <20241019002232.43313-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241018181842.1368394-5-denkenz@gmail.com>
References: <20241018181842.1368394-5-denkenz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D043UWC001.ant.amazon.com (10.13.139.202) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

From: Denis Kenzior <denkenz@gmail.com>
Date: Fri, 18 Oct 2024 13:18:22 -0500
> @@ -1234,6 +1247,78 @@ static int qrtr_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
>  	return rc;
>  }
>  
> +static int qrtr_setsockopt(struct socket *sock, int level, int optname,
> +			   sockptr_t optval, unsigned int optlen)
> +{
> +	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
> +	struct sock *sk = sock->sk;
> +	unsigned int val = 0;
> +	int rc = 0;
> +
> +	if (level != SOL_QRTR)
> +		return -ENOPROTOOPT;
> +
> +	if (optlen >= sizeof(val) &&
> +	    copy_from_sockptr(&val, optval, sizeof(val)))
> +		return -EFAULT;
> +
> +	lock_sock(sk);

This seems unnecessary to me.

sk_setsockopt(), do_ip_setsockopt(), and do_ipv6_setsockopt() do not
hold lock_sock() for assign_bit().

Also, QRTR_BIND_ENDPOINT in a later patch will not need lock_sock()
neither.  The value is u32, so you can use WRITE_ONCE() here and
READ_ONCE() in getsockopt().


> +
> +	switch (optname) {
> +	case QRTR_REPORT_ENDPOINT:
> +		assign_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags, val);
> +		break;
> +	default:
> +		rc = -ENOPROTOOPT;
> +	}
> +
> +	release_sock(sk);
> +
> +	return rc;
> +}
> +
> +static int qrtr_getsockopt(struct socket *sock, int level, int optname,
> +			   char __user *optval, int __user *optlen)
> +{
> +	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
> +	struct sock *sk = sock->sk;
> +	unsigned int val;
> +	int len;
> +	int rc = 0;
> +
> +	if (level != SOL_QRTR)
> +		return -ENOPROTOOPT;
> +
> +	if (get_user(len, optlen))
> +		return -EFAULT;
> +
> +	if (len < sizeof(val))
> +		return -EINVAL;
> +
> +	lock_sock(sk);

Same remark.


> +
> +	switch (optname) {
> +	case QRTR_REPORT_ENDPOINT:
> +		val = test_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags);
> +		break;
> +	default:
> +		rc = -ENOPROTOOPT;
> +	}
> +
> +	release_sock(sk);
> +
> +	if (rc)
> +		return rc;
> +
> +	len = sizeof(int);
> +
> +	if (put_user(len, optlen) ||
> +	    copy_to_user(optval, &val, len))
> +		rc = -EFAULT;
> +
> +	return rc;
> +}
> +
>  static int qrtr_release(struct socket *sock)
>  {
>  	struct sock *sk = sock->sk;

