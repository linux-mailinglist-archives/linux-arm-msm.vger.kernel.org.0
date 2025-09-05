Return-Path: <linux-arm-msm+bounces-72246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34307B45467
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B73C7AFFFE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B192D47F9;
	Fri,  5 Sep 2025 10:20:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AAF2D46D8;
	Fri,  5 Sep 2025 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067638; cv=none; b=jMK2c1EaUDrenhSveF24QOIR8rklW7e2vsQgtuxvwUjVdu8arWc6CrcNTZ8vK6cnPaG6SlmjHuPQnjKgCGbBzRn0ltTLbG6+op0yp2QdOUPIhbgLE+UtatjIP/VJQ7I+1uccizSInoWCiNNpIqfRliiFiNt63scEwN8EfyrFYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067638; c=relaxed/simple;
	bh=HnPEUWmGMhAPulchLlYkOSU9Nq+SlXkxxTHApPFtel4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVx+VcbBYc8DJqNqchd5G6aJ8r4UvHI/pTdWziHK6bldrsdgMVTDtsE0VXlO6ixbLYBRkU00mVQorL4H6UVIq6yNcO5pIH1Ii1UbQ7UL0+TN88cyt8p67K8pnFEE5YUpneeRRVbbEKnDLHY+3UXAqmdPjQiTJwmVGG+6uIThDNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cJBQF6cZVz9sSh;
	Fri,  5 Sep 2025 11:49:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RcDlpa8gf6Cl; Fri,  5 Sep 2025 11:49:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cJBQD56YSz9sSf;
	Fri,  5 Sep 2025 11:49:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 97D228B774;
	Fri,  5 Sep 2025 11:49:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id RTrywvFHm_LN; Fri,  5 Sep 2025 11:49:24 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D74578B773;
	Fri,  5 Sep 2025 11:49:23 +0200 (CEST)
Message-ID: <d5bfa13f-379f-493a-a410-400dd3782207@csgroup.eu>
Date: Fri, 5 Sep 2025 11:49:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tty: remove redundant condition checks
To: Xichao Zhao <zhao.xichao@vivo.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250905091321.437476-1-zhao.xichao@vivo.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250905091321.437476-1-zhao.xichao@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 05/09/2025 à 11:13, Xichao Zhao a écrit :
> Remove redundant condition checks and replace else if with else.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/tty/hvc/hvc_console.c   | 2 +-
>   drivers/tty/serial/msm_serial.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
> index cd1f657f782d..fffc30b9ea54 100644
> --- a/drivers/tty/hvc/hvc_console.c
> +++ b/drivers/tty/hvc/hvc_console.c
> @@ -184,7 +184,7 @@ static void hvc_console_print(struct console *co, const char *b,
>   					hvc_console_flush(cons_ops[index],
>   						      vtermnos[index]);
>   				}
> -			} else if (r > 0) {
> +			} else {
>   				i -= r;
>   				if (i > 0)
>   					memmove(c, c+r, i);
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> index 3449945493ce..2e999cb9c974 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -1102,7 +1102,7 @@ msm_find_best_baud(struct uart_port *port, unsigned int baud,
>   
>   			if (result == baud)
>   				break;
> -		} else if (entry->divisor > divisor) {
> +		} else {
>   			old = target;
>   			target = clk_round_rate(msm_port->clk, old + 1);
>   			/*


